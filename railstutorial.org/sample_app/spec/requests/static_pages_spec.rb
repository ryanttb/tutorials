require( "spec_helper" );

describe( "static_pages" ) {
  let (:base_title) { "Ruby on Rails Tutorial Sample App" };

  describe( "about" ) {
    it( "should have the content 'About'" ) {
      visit( about_path );
      page.should( have_content( "About" ) );
    }
  }

  describe( "contact" ) {
    it( "should have the title ':base_title | Contact Us'" ) {
      visit( contact_path );
      page.should( have_selector( "title", { text: "#{base_title} | Contact Us" } ) );
    }

    it( "should have 'Contact Us' in the header" ) {
      visit( contact_path );
      page.should( have_selector( "h1", { text: "Contact Us" } ) );
    }
  }

  describe( "help" ) {
    it( "should have the content 'Help'" ) {
      visit( help_path );
      page.should( have_content( "Help" ) );
    }
  }

  describe( "home" ) {
    before( :each ) {
      visit( root_path )
    }

    it( "should have 'Home' in the title" ) {
      page.should( have_selector( "title", { text: "Home" } ) );
    }

    it( "should have a sign up link" ) {
      page.should( have_selector( "a", { text: "Sign up" } ) );
    }

    it( "should have navigation" ) {
      page.should( have_selector( "nav" ) );
    }
  }
}
