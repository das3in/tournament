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

      # Collision
      david = User.create(
        email: "david@collision.com",
        first_name: "David",
        last_name: "Ramirez",
        password: "password",
        password_confirmation: "password",
      )
      collision = Team.create(
        name: "Collision",
        captain: david,
        recruiting: true,
      )
      collision.users << david

      # Rising
      diehl = User.create(
        email: "diehl@rising.com",
        first_name: "Patrick",
        last_name: "Diehl",
        password: "password",
        password_confirmation: "password",
      )
      rising = Team.create(name: "Phoenix Rising", captain: diehl, recruiting: true)
      rising.users << diehl

      # 406
      rangel = User.create(
        email: "rangel@undr.com",
        first_name: "Chris",
        last_name: "Rangel",
        password: "password",
        password_confirmation: "password",
      )
      four06 = Team.create(name: "406 Finest", captain: rangel, recruiting: true)
      four06.users << rangel

      # Narcos
      rios = User.create(
        email: "rios@narcos.com",
        first_name: "Oz",
        last_name: "Rios",
        password: "password",
        password_confirmation: "password",
      )
      narcos = Team.create(name: "Narcos", captain: rios, recruiting: true)
      narcos.users << rios

      # Aftermath
      jerry = User.create(
        email: "jerry@aftermath.com",
        first_name: "Jerry",
        last_name: "Van Cleeve",
        password: "password",
        password_confirmation: "password",
      )
      aftermath = Team.create(name: "SD Aftermath", captain: jerry, recruiting: true)
      aftermath.users << jerry

      # DMG
      howe = User.create(
        email: "howe@dmg.com",
        first_name: "Shane",
        last_name: "Howe",
        password: "password",
        password_confirmation: "password",
      )
      dmg = Team.create(name: "Sacramento DMG", captain: howe, recruiting: true)
      dmg.users << howe

      # Elevation
      cuaderno = User.create(
        email: "cuaderno@elevation.com",
        first_name: "Ryan",
        last_name: "Cuaderno",
        password: "password",
        password_confirmation: "password",
      )
      elevation = Team.create(name: "Scottsdale Elevation", captain: cuaderno, recruiting: true)
      elevation.users << cuaderno


      # Event Setup
      event = create(:event, name: "WCPPL Event 1 - Oceanside Classic")
      division = create(:division)
      tournament = create(:tournament, division: division, event: event)
    end
  end
end
