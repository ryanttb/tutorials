require( "spec_helper" );

describe( "Sample App" ) {
  let (:base_title) { "Ruby on Rails Tutorial Sample App" };

  subject { page }

  describe( "/about" ) {
    before( :each ) { visit( about_path ); }

    it {
      should( have_content( "About" ) );
    }
  }

  describe( "/contact" ) {
    before( :each ) { visit( contact_path ); }

    it {
      should( have_selector( "title", { text: "#{base_title} | Contact Us" } ) );
    }

    it {
      should( have_selector( "h1", { text: "Contact Us" } ) );
    }
  }

  describe( "help" ) {
    before( :each ) { visit( help_path ) }

    it {
      should( have_content( "Help" ) );
    }
  }

  describe( "/" ) {
    before( :each ) { visit( root_path ) }

    it {
      should( have_selector( "title", { text: full_title( "" ) } ) );
    }

    it {
      should( have_selector( "a", { text: "Sign up" } ) );
    }

    it {
      should( have_selector( "nav" ) );
    }
  }
}
