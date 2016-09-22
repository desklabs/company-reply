# Desk.com Company Case Reply
The **Desk.com Company Case Reply** is a simple application that creates replies to company cases. It allows you to redirect the reply form from the customer portal to an endpoint to create replies on company cases.

## I. Deploy the Application
First, install this application by deploying the source code to your Heroku account. To deploy your application, simply click this button:

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https%3A%2F%2Fgithub.com%2Fdesklabs%2Fcompany-reply)

## II. Change the Web Theme
```html
{% if case.is_email_channel? %}
  {% if case.customer.id == desk.customer.id %}
  {{form_begin}}
  {% else %}
  <form action="https://YOURAPP.herokuapp.com/reply" enctype="multipart/form-data" class="new_reply" id="new_reply" method="post">
    <input id="interaction_ticket_id" name="interaction[ticket_id]" type="hidden" value="{{case.id}}">
    <input id="interaction_customer_email" name="interaction[customer_email]" type="hidden" value="{{desk.customer.email}}"> 
  {% endif %}
    <div class='input-block'>
      <h4>{{desk.system.snippets.reply_to_this_case}}</h4>
      <div>
        <textarea id="interaction_body"   name="interaction[body]"></textarea>
      </div>
    </div>
    {% if case.customer.id == desk.customer.id %}
    <div class='input-block'>
      <span class='label'>
        {{system.snippets.file_attachment}}
      </span>
      <div class="desk_file_upload">
        <input name="case_attachment[attachment]" size="84" type="file"/>
        <div class="faux-file-field">
          <input type="text" disabled="disabled"/>
        </div>
        <input type="button" value="{{system.snippets.choose_file}}"/>
      </div>
    </div>
    {% endif %}
    <br/>
    <div class='input-button'>
      <input id='reply_submit' name='commit' type='submit' value='{{system.snippets.send_text}}' />
    </div>
  {{form_end}}
{% else %}
```
