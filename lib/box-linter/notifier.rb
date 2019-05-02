require 'json'

class Notifier
  def initialize
    @slack = Slack::Incoming::Webhooks.new ENV['SLACK_WEBHOOK_URL']
  end

  def notify!(warning)
    attachments = []
    attachments << {
        title: "#{warning[:name]}の治安が悪化しています",
        title_link: "https://app.box.com/folder/#{warning[:id]}",
        fields: _fields(warning[:alerts]),
        color: 'danger'
    }

    @slack.post "", attachments: attachments
  end

  private

  def _fields(warning)
    fields = []
    warning.each do |w|
      next if w.length == 2

      fields << {
          title: "#{w[:name]}",
          value: _value(w)
      }
    end

    fields
  end

  def _value(warning)
    value = []
    warning.each do |k, _|
      next if k == :id || k == :name
      value << "#{k.to_s.split('_')[0]}の設定が誤っています"
    end

    value.join("\n")
  end
end