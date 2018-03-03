if Rails.env.development? || Rails.env.test?
  require "factory_bot"

  namespace :dev do
    desc "Sample data for local development environment"
    task prime: "db:setup" do
      include FactoryBot::Syntax::Methods

      # Team & User setup
      captain = create(:user)
      team = create(:team, captain: captain)
      team.users << captain

      4.times do
        p = create(:user)
        team.users << p
      end

      # Event Setup
      event = create(:event)
      division = create(:division)
      tournament = create(:tournament, division: division, event: event)
    end
  end
end
