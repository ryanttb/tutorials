require "spec_helper";

describe( "Users controller" ) {
  before {
    @user = User.new( {
      name: "Ryan Westphal",
      email: "rwestphal@cyber.law.harvard.edu",
      password: "foobar",
      password_confirmation: "foobar"
    } );
  }

  describe( "gravatar_url function" ) {
    subject { gravatar_url( @user ) }

    it( "should return MD5" ) {
      should =~ /a42e91f0d5c9a2ad047d89e33bc550fb/;
    }

    it( "should ignore case" ) {
      @user.email = "RWESTPHAL@CYBER.LAW.HARVARD.EDU";
      gravatar_url( @user ).should =~ /a42e91f0d5c9a2ad047d89e33bc550fb/;
    }
  }
}
