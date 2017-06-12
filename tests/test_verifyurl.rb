require 'test/unit'

class TestGameStart < Test::Unit::TestCase

  def test_game_start
    # open file to read
    file = File.read('./README.md')

    # get url for remote
    remote = `git config remote.origin.url`

    # get username in remote url
    split_remote = remote.to_s.split('/')
    username_remote = split_remote[3]
    print 'Username in remote: '
    puts username_remote

    # search for README url, assign to link
    link_index = file.index('at:')
    link_end_index = file.index('>> _*SUP')
    link = file[link_index...link_end_index - 3]

    # get username from link in readme
    split_readme = link.to_s.split(/[\s\/.]/)
    username_readme = split_readme[3]
    print 'Username in README: '
    puts username_readme


    # compare those strings, pass test if they're equal
    assert_equal(username_remote, username_readme, "The URL to the game in the README.md doesn't match the username in the remote repository.")
  end

end
