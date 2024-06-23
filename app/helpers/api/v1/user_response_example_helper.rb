module Api::V1::UserResponseExampleHelper
  def index_response
    '
      {
        "users": [
            {
                "id": 44,
                "first_name": "Jane",
                "last_name": "Smith",
                "email": "jane.smith@example.com",
                "date_of_birth": "1985-05-05",
                "address": "456 Elm St"
            }
        ],
        "pagy": {
            "current_page": 1,
            "next_page": 2,
            "prev_page": null,
            "total_pages": 2,
            "total_count": 10
        }
      }
      '
  end

  def show_response
    '
      {
        "id": 45,
        "first_name": "Alice",
        "last_name": "Johnson",
        "email": "alice.johnson@example.com",
        "date_of_birth": "1992-03-12",
        "address": "789 Pine St"
      }
      '
  end

  def create_response
    '
      {
        "first_name": "John",
        "last_name": "Doe",
        "email": "john.doe@gmail.com",
        "date_of_birth": "2001-01-01",
        "address": "Talisay City, Cebu"
      }
      '
  end

  def update_response
    '
      {
        "first_name": "John",
        "last_name": "Doe",
        "email": "john.doe@gmail.com",
        "date_of_birth": "2001-01-01",
        "address": "Talisay City, Cebu"
      }
      '
  end
end
