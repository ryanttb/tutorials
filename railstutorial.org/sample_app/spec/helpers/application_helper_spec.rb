require "spec_helper";

describe( "ApplicationHelper module" ) {
  describe( "full_title function" ) {
    it( "should include a given title" ) {
      # should( /foo/ =~ full_title( "foo" ) );
      # what's with this syntax?
      full_title( "foo" ).should =~ /foo/;
    }

    it( "should start with the base title" ) {
      full_title( "foo" ).should =~ /^Ruby on Rails Tutorial Sample App/;
    }

    it( "shouldn't have a pipe on the home page" ) {
      full_title( "" ).should_not =~ /\|/;
    }
  }
}
