$stdout.sync = $stderr.sync = true
require 'sinatra'
require 'desk_api'

post '/reply' do
  i = params['interaction']
  DeskApi.by_url("/api/v2/cases/#{i['ticket_id']}/replies").create({
    body: i['body'],
    direction: 'in',
    status: 'sent',
    to: ENV['SUPPORT_EMAIL'],
    from: i['customer_email'],
    hidden_at: nil
  })
  redirect request.referer
end
