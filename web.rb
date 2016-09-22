$stdout.sync = $stderr.sync = true
require 'sinatra'
require 'desk_api'

post '/reply' do
  i = params['interaction']
  puts i.inspect
  resp = DeskApi.by_url("/api/v2/cases/#{i['ticket_id']}/replies").create({
    body: i['body'],
    direction: 'in',
    status: 'sent',
    to: ENV['SUPPORT_EMAIL'],
    from: i['customer_email']
  })
  puts resp.inspect
  redirect request.referer
end
