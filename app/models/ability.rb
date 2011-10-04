class Ability
  include CanCan::Ability

  def initialize(user)
    # clean slate
    cannot :manage, :all
    can :manage, User, :id => user.id

    if user.manager?
      can(:show, Company) { |c| user.company_id == c.id }
      can(:show, User)    { |u| user.manager_for(u) }
    end
  end
end
