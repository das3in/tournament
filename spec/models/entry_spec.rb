require "rails_helper"

describe Entry do
  context "associations" do
    it "should have valid associations" do
      should belong_to(:team)
      should belong_to(:tournament)
      should have_many(:home_matches)
      should have_many(:away_matches)
      should have_many(:users)
    end
  end

  describe "#matches" do
    it "should return all matches where the entry is the home or away team" do
      e = create(:event)
      d = create(:division)
      p = create(:user)
      f = create(:field, event: e)
      t1 = create(:timeslot, field: f)
      t2 = create(:timeslot, field: f)
      t3 = create(:timeslot, field: f)
      tournament = create(:tournament, event: e, division: d)
      home_team = create(:team, captain: p)
      away_team = create(:team, captain: p)
      other_team = create(:team, captain: p)
      home_entry = create(:entry, tournament: tournament, team: home_team)
      away_entry = create(:entry, tournament: tournament, team: away_team)
      other_entry = create(:entry, tournament: tournament, team: other_team)

      round1 = create(
        :match,
        tournament: tournament,
        home_team: away_entry,
        away_team: home_entry,
        timeslot: t1,
      )
      round2 = create(
        :match,
        tournament: tournament,
        home_team: home_entry,
        away_team: away_entry,
        timeslot: t2,
      )
      round3 = create(
        :match,
        tournament: tournament,
        home_team: home_entry,
        away_team: other_entry,
        timeslot: t3,
      )

      expect(away_entry.matches.count).to eq(2)
      expect(away_entry.matches).to include(round1)
      expect(away_entry.matches).to include(round2)
      expect(away_entry.matches).not_to include(round3)
    end
  end
end
