require "spec_helper";

describe( "users controller" ) {
  subject { page };

  describe( "get /signup" ) {
    before( ) { visit( signup_path ); }

    it( ) {
      should( have_selector( "h1", { text: "Sign up" } ) );
    }

    it( ) {
      should( have_selector( "title", { text: full_title( "Sign up" ) } ) );
    }
  }

  describe( "get /users/id") {
    before( ) {
      @user = User.create( {
        name: "Ryan Westphal",
        email: "rwestphal@cyber.law.harvard.edu",
        password: "foobar",
        password_confirmation: "foobar"
      } );

      visit( user_path(@user) );
      # replaced by above
      #visit( "#{users_path}/#{@user.id}" );
    }

    it { should( have_selector( "title", { text: @user.name } ) ); }
    it { should( have_selector( "h1", { text: @user.name } ) ); }
  }
}
