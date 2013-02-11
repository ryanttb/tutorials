module UsersHelper
  # returns the Gravatar URL for given user
  def gravatar_url( user )
    gravatarId = Digest::MD5::hexdigest( user.email.downcase( ) );
    return "https://secure.gravatar.com/avatar/#{gravatarId}";

    # I can't get image_tag to work in the controller spec
    #return image_tag( gravatarUrl, {
    #  alt: user.name,
    #  class: "gravatar"
    #} );
  end
end
