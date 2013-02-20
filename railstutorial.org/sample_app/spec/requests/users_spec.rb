require "spec_helper";

describe( "users requests" ) {
  subject { page };

  describe( "get /signup" ) {
    let( :submit ) { "Create my account" }

    before( ) { visit( signup_path ); }

    describe( "source" ) {
      it( ) {
        should( have_selector( "h1", { text: "Sign up" } ) );
      }

      it( ) {
        should( have_selector( "title", { text: full_title( "Sign up" ) } ) );
      }

      it( ) {
        should( have_selector( "input[type='submit']", { value: submit } ) );
      }
    }

    describe( "post /signup" ) {
    }
  }

  describe( "get /users/id") {
    let( :user ) { FactoryGirl.create( :user ) }

    before( ) {
      visit( user_path( user ) );
      # replaced by above
      #visit( "#{users_path}/#{user.id}" );
    }

    it { should( have_selector( "title", { text: user.name } ) ); }
    it { should( have_selector( "h1", { text: user.name } ) ); }
  }
}
