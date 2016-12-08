json.extract! ticket, :id, :total, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)