require 'faker'

ROLES_TO_ADD = %w[admin basic].freeze
TEST_EMAIL = 'admin_user@example.com'.freeze
TEST_PASSWORD = 'password'.freeze
USERS = [
  {
    # admin user
    first_name: 'Admin',
    last_name: 'User',
    email: TEST_EMAIL, 
    password: TEST_PASSWORD,
    role: :admin
  },
  {
    # basic user
    first_name: 'First',
    last_name: 'User',
    email: 'first_user@example.com', 
    password: TEST_PASSWORD
  },
  {
    # basic user
    first_name: 'Second',
    last_name: 'User',
    email: 'second_user@example.com', 
    password: TEST_PASSWORD
  },
  {
    # blocked user
    first_name: 'Blocked',
    last_name: 'User',
    email: 'blocked_user@example.com', 
    password: TEST_PASSWORD,
    status: 'blocked'
  },
].freeze

CATEGORIES = [
  {
    name: 'nba',
    subcategories: %w[north west]
  },
  {
    name: 'nhl',
    subcategories: %w[south east]
  },
  {
    name: 'soccer',
    subcategories: %w[usa europe south_america]
  },
  {
    name: 'golf',
    subcategories: %w[usa australia]
  },
  {
    name: 'baseball',
    subcategories: %w[suoth north east west]
  },
  {
    name: 'nascar'
  }
].freeze

BANER_NAMES = %w[baseball soccer nba].freeze

def fill_database
  create_user_roles
  create_users
  create_categories
  create_teams
  create_articles
  create_comments_to_articles
  add_likes_to_comments
  create_surveys
  create_survey_answers
  create_survey_responders
  create_baners
end

def create_user_roles
  ROLES_TO_ADD.each do |role_name|
    Role.find_or_initialize_by(name: role_name).save!
  end
end

def create_users
  USERS.each do |user|
    u = User.find_or_initialize_by(email: user[:email])
    u.first_name = user[:first_name]
    u.last_name = user[:last_name]
    u.password = user[:password]
    u.add_role user[:role] if user[:role].present? 
    u.status =  user[:status] if user[:status].present? 

    u.save!
  end
end

def create_categories
  CATEGORIES.each do |category|
    c = Category.find_or_initialize_by(name: category[:name])
    c.save! if c.new_record?
    return  unless category[:subcategories].present?
    category[:subcategories].each do |subcategory|
      s = Category.find_or_initialize_by(name: subcategory)
      if s.new_record?
        s.parent = c
        s.save!
      else
        scope = c.children.pluck(:name)
        Category.create!(name: subcategory, parent: c) if scope.exclude?(subcategory)
      end
    end
  end
end

def create_teams  
  Category.last_childs.each do |category|
    break if category.teams.count == 3
    3.times do
      team = Team.find_or_initialize_by(name: Faker::Team.name)
      team.location = Faker::Team.state
      team.category_id = category.id
      team.save!
    end
  end
end

def create_articles
  # creates categories articles
  Category.all.to_a.each do |category|
    break if category.articles.count == 1
    article_creation_template(
      published: 'published',
      category_id: category.id
    )
  end
  # creates teams articles
  Team.all.to_a.each do |team|
    break if team.articles.count == 2
    2.times do
      article_creation_template(
        published: 'published',
        team_id: team.id,
        category_id: team.category.id
      )
    end
  end
end
  
def article_creation_template(**args)
  article = Article.find_or_initialize_by(name: Faker::Lorem.sentence)
  article.caption = Faker::Lorem.sentence(word_count: 7)
  article.content = Faker::Lorem.paragraph(sentence_count: 20)
  article.picture_text = Faker::Lorem.sentence(word_count: 2)

  article.article_type = args[:article_type] if args[:article_type]
  article.comments_on = args[:comments] if args[:comments]
  article.main_page = args[:main_page] if args[:main_page]
  article.status = args[:published] if args[:published]
  article.author_id = User.with_role(:admin).first.id
  article.team_id = args[:team_id] if args[:team_id]
  article.category_id = args[:category_id] if args[:category_id]
  article.save!
end

def create_comments_to_articles
  # add comments to articles
  Article.where(comments_on: true).each do |article|
    break if article.comments.count == 3
     # add comments to articles
    2.times do
      Comment.create!(
        text: Faker::Lorem.paragraph,
        article_id: article.id,
        author_id: User.pluck(:id).sample,
      )
    end
    # add comment to first article comment
    subcomment = Comment.new(
      text: Faker::Lorem.paragraph,
      article_id: article.id,
      author_id: User.pluck(:id).sample,
    )
    subcomment.parent = article.comments.first
    subcomment.save!
  end
end

def add_likes_to_comments
  Comment.all.each do |comment|
    break if comment.reactions.count == 3
    3.times do |i|
      CommentReaction.create!(
        reaction: i < 2 ? 'like' : 'dislike',
        comment_id: comment.id,
        user_id: User.pluck(:id)[i]
      )
    end
  end
end

def create_surveys
  return if Survey.count == 3
  3.times do
    Survey.create!(
      question: Faker::Lorem.question,
      status: 'published',
      author_id: User.with_role(:admin).first.id
    )
  end
end

def create_survey_answers
  Survey.all.each do |survey|
    return if survey.answers.count == 2
    2.times do 
      Answer.create!(
        text: Faker::Lorem.sentence,
        survey_id: survey.id
      )
    end
  end
end

def create_survey_responders
  responders = User.with_role(:basic).pluck(:id)
  Survey.all.each do |survey|
    break if survey.responders.count == 2
    2.times do |i|
      SurveyResponder.create!(
        responder_answer: survey.answers.first,
        responder_id: responders[i],
        survey_id: survey.id
      )
    end
  end
end

def create_baners
  BANER_NAMES.each do |name|
    baner = Baner.find_or_initialize_by(name: name)
    baner.content = Faker::Lorem.paragraph
    baner.category_id = Category.find_by(name: name).id
    baner.save!
    baner.published!
  end
end

fill_database
