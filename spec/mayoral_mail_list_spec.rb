require_relative "../lib/mayoral_mail_list"

describe 'get_townhall_urls' do
  it 'It needs to give me the emails that I want' do
    expect(get_townhall_urls).not_to be_nil
  end
end


describe 'get_townhall_urls' do
  it 'should contain the website ' do
    expect(get_townhall_urls).to_not contain_exactly("https://www.annuaire-des-mairies.com./95/aincourt.html")
  end
end