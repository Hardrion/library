module Api::V1::FavoriteResponseExampleHelper
  def index_response
    '
    {
    "favorites": [
        {
            "id": 62,
            "title": "The Great Adventure",
            "author": "John Smith",
            "country": "USA",
            "publication_date": "2020-01-15",
            "total_chapters": 12
        }
    ],
    "pagy": {
        "current_page": 1,
        "next_page": null,
        "prev_page": null,
        "total_pages": 1,
        "total_count": 1
    }
    }
        '
  end

  def create_response
    '
    {
    "book_id": 1
    }
    '
  end
end
