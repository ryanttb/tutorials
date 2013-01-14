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

  describe( "when name is blank" ) {
    before { @user.name = " " }

    it { should_not( be_valid() ); }
  }

  describe( "when name is too long" ) {
    before { @user.name = "a" * 51 }

    it { should_not( be_valid() ); }
  }

  describe( "when email is blank " ) {
    before { @user.email = " " }

    it { should_not( be_valid() ); }
  }

  describe( "when email format is invalid" ) {
    it {
      addresses = %w[ user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com ];
      addresses.each { |invalid_address|
        @user.email = invalid_address;
        should_not( be_valid() );
      }
    }
  }

  describe( "when email format is valid" ) {
    it {
      addresses = %w[ user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn ];
      addresses.each { |valid_address|
        @user.email = valid_address;
        should( be_valid( ) );
      }
    }
  }

  describe( "when email is already taken (case insensitive)" ) {
    before {
      user_with_same_email = @user.dup( );
      user_with_same_email.email = @user.email.upcase( );
      user_with_same_email.save( );
    }

    it { should_not( be_valid( ) ) }
  }

  #pending( "add some examples to (or delete) #{__FILE__}" );
}
