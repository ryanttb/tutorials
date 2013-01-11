require( "spec_helper" );

describe( "static_pages controller" ) {
  let( :base_title ) { "Ruby on Rails Tutorial Sample App" };

  subject { page }

  shared_examples_for( "all_static_pages" ) {
    it { should( have_selector( "h1", { text: heading } ) ); }
    it { should( have_selector( "title", { text: full_title( page_title ) } ) ) }
  }

  describe( "get /about" ) {
    before( ) { visit( about_path ); }

    let( :heading ) { "About" }
    let( :page_title ) { "About" }

    it_should_behave_like( "all_static_pages" );
  }

  describe( "get /contact" ) {
    before( :each ) { visit( contact_path ); }

    let( :heading ) { "Contact Us" }
    let( :page_title ) { "Contact Us" }

    it_should_behave_like( "all_static_pages" );
  }

  describe( "get /help" ) {
    before( :each ) { visit( help_path ) }

    let( :heading ) { "Help" }
    let( :page_title ) { "Help" }

    it_should_behave_like( "all_static_pages" );
  }

  describe( "get /" ) {
    before( :each ) { visit( root_path ) }

    let( :heading ) { "Sample App" }
    let( :page_title ) { "" }

    it_should_behave_like( "all_static_pages" );

    it {
      should( have_selector( "a", { text: "Sign up" } ) );
    }

    it {
      should( have_selector( "a.btn[href='/signup']" ) );
    }

    it {
      should( have_selector( "nav" ) );
    }
  }
}
