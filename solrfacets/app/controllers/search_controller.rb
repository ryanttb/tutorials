class SearchController < ApplicationController
  def search
    # only search if keywords exist
    if params[ :keywords ].nil? || params[ :keywords ].empty?
      @hits = [ ]
    else
      @search = Project.search do
        fulltext params[ :keywords ] do
          highlight :description
        end

        facet :tag_list
        paginate :per_page => 10

        # tags, AND'd
        if params[ :tag ].present?
          all_of do
            params[ :tag ].each do |tag|
              with( :tag_list, tag )
            end
          end
        end
        

      end
      @hits = @search.hits

    end
  end
end
