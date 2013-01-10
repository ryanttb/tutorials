require( "spec_helper" );

describe "static_pages" do
  let (:base_title) { "Ruby on Rails Tutorial Sample App" };

  describe "about" do
    it "should have the content 'About'" do
      visit( "/static_pages/about" );
      page.should( have_content( "About" ) );
    end
  end

  describe "contact" do
    it "should have the title ':base_title | Contact Us'" do
      visit( "/static_pages/contact" );
      page.should( have_selector( "title", {
        :text => "#{base_title} | Contact Us"
      } ) );
    end

    it "should have 'Contact Us' in the header" do
      visit( "/static_pages/contact" );
      page.should( have_selector( "h1", {
        :text => "Contact Us"
      } ) );
    end
  end

  describe "help" do
    it "should have the content 'Help'" do
      visit( "/static_pages/help" );
      page.should( have_content( "Help" ) );
    end
  end

  describe "home" do
    it "should have 'Home' in the title" do
      visit( "/static_pages/home" );
      page.should( have_selector( "title", {
        :text => "Home"
      } ) );
    end
  end
end
