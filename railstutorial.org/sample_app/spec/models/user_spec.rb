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
      email: "rwestphal@harvard.edu",
      password: "foobar",
      password_confirmation: "foobar"
    } );
  }

  subject { @user }

  it { should( respond_to( :name ) ); }

  it { should( respond_to( :email ) ); }

  it { should( respond_to( :password_digest ) ); }

  it { should( respond_to( :password ) ); }

  it { should( respond_to( :password_confirmation ) ); }

  it { should( respond_to( :authenticate ) ); }

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

    it { should_not( be_valid( ) ); }
  }

  describe( "when email is in mixed case" ) {
    let( :mixed_case_email ) { "RWestphal@Harvard.EDU" }

    before {
      @user.email = mixed_case_email;
      @user.save( );
      @user.reload.email( );
    }

    it( "should be in all lower-case" ) {
      @user.email.should == mixed_case_email.downcase( );
    }
  }

  describe( "when password is nil" ) {
    before {
      @user.password = nil;
    }

    it { should_not( be_valid( ) ); }
  }

  describe( "when password is blank" ) {
    before {
      @user.password = " ";
    }

    it { should_not( be_valid( ) ); }
  }

  describe( "when confirmation is nil" ) {
    before {
      @user.password_confirmation = nil;
    }

    it { should_not( be_valid( ) ); }
  }

  describe( "when confirmation is blank" ) {
    before {
      @user.password_confirmation = " ";
    }

    it { should_not( be_valid( ) ); }
  }

  describe( "when password doesn't match confirmation" ) {
    before {
      @user.password_confirmation = "bar";
    }

    it { should_not( be_valid( ) ); }
  }

  describe( "return value of authenticate method" ) {
    before {
      # we need to save before any of these tests
      @user.save( );
    }

    # find a user by email, it should always find one
    let( :found_user ) { User.find_by_email( @user.email ); }

    describe( "with valid password" ) {
      # authenticates the found user with its own password, this should authenticate
      it { should == found_user.authenticate( @user.password ); }
    }

    describe( "with invalid password" ) {
      let( :invalid_pw_user ) { found_user.authenticate( "invalid" ); }

      it { should_not == invalid_pw_user }

      specify { invalid_pw_user.should( be_false( ) ); }
    }
  }

  describe( "when a password is too short" ) {
    before {
      @user.password = @user.password_confirmation = "a" * 5;
    }

    it { should_not( be_valid( ) ); }
  }

  #pending( "add some examples to (or delete) #{__FILE__}" );
}
