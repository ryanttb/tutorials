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

  #pending( "add some examples to (or delete) #{__FILE__}" );
}
