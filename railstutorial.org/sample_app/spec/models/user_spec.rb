# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "spec_helper";

describe( "User model" ) {
  before {
    @user = User.new( {
      name: "Ryan Westphal",
      email: "rwestphal@cyber.law.harvard.edu"
    } );
  }

  subject { @user }

  it { should( respond_to( :name ) ); }

  it { should( respond_to( :email ) ); }

  it { should( be_valid() ); }

  describe( "blank name" ) {
    before { @user.name = " " }

    it { should_not( be_valid() ); }
  }

  describe( "blank email" ) {
    before { @user.email = " " }

    it { should_not( be_valid() ); }
  }

  #pending( "add some examples to (or delete) #{__FILE__}" );
}
