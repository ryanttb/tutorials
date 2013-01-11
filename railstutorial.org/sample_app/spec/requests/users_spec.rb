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
}
