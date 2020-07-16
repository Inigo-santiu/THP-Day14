require_relative "../lib/mayoral_mail_list"

describe 'get_townhall_urls' do
  it 'It needs to give me the emails that I want' do
    expect(get_townhall_urls).not_to be_nil
  end
end
