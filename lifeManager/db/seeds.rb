# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# uses this dictionary to generate random tags
load "#{Rails.root}/db/words.rb"

def gen_tag
  str = String.new
  len = rand(4) + 1
  for i in 1..len
    str += $words.sample + " "
  end
  return str
end

users = User.create(
  [
    { email: 'a@a.com', name: "Mrs. Aardvark", password: "a", password_confirmation: "a"},
    { email: 'b@b.com', name: "Mrs. Bear", password: "b", password_confirmation: "b"},
    { email: 'c@c.com', name: "Mrs. Cat", password: "c", password_confirmation: "c"},
    { email: 'd@d.com', name: "Mrs. Dog", password: "d", password_confirmation: "d"},
    { email: 'e@e.com', name: "Mrs. Elephant", password: "e", password_confirmation: "e"},
    { email: 'f@f.com', name: "Mrs. Fox", password: "f", password_confirmation: "f"},
    { email: 'g@g.com', name: "Mrs. Gopher", password: "g", password_confirmation: "g"},
    { email: 'h@h.com', name: "Mrs. Horse", password: "h", password_confirmation: "h"},
    { email: 'i@i.com', name: "Mrs. Iguana", password: "i", password_confirmation: "i"},
    { email: 'j@j.com', name: "Mrs. Jackrabbit", password: "j", password_confirmation: "j"},
    { email: 'k@k.com', name: "Mrs. Kangaroo", password: "k", password_confirmation: "k"},
    { email: 'l@l.com', name: "Mrs. Lama", password: "l", password_confirmation: "l"},
    { email: 'm@m.com', name: "Mrs. Mouse", password: "m", password_confirmation: "m"},
    { email: 'n@n.com', name: "Mrs. Numbat", password: "n", password_confirmation: "n"},
    { email: 'o@o.com', name: "Mrs. Opossum", password: "o", password_confirmation: "o"},
    { email: 'p@p.com', name: "Mrs. Peacock", password: "p", password_confirmation: "p"},
    { email: 'q@q.com', name: "Mrs. Quail", password: "q", password_confirmation: "q"},
    { email: 'r@r.com', name: "Mrs. Rabbit", password: "r", password_confirmation: "r"},
    { email: 's@s.com', name: "Mrs. Snake", password: "s", password_confirmation: "s"},
    { email: 't@t.com', name: "Mrs. Tiger", password: "t", password_confirmation: "t"},
    { email: 'u@u.com', name: "Mrs. Urial", password: "u", password_confirmation: "u"},
    { email: 'v@v.com', name: "Mrs. Vulture", password: "v", password_confirmation: "v"},
    { email: 'w@w.com', name: "Mrs. Wombat", password: "w", password_confirmation: "w"},
    { email: 'x@x.com', name: "Mrs. Xerox", password: "x", password_confirmation: "x"},
    { email: 'y@y.com', name: "Mrs. Yak", password: "y", password_confirmation: "y"},
    { email: 'z@z.com', name: "Mrs. Zebra", password: "z", password_confirmation: "z"},
  ]
)


articles = Article.create(
  [
    { name: "Mocha Tutorial", url: "https://semaphoreci.com/community/tutorials/getting-started-with-node-js-and-mocha", user_id: 1 },
    { name: "DJTT - Ableton Live", url: "http://djtechtools.com/2012/04/18/how-to-start-djing-in-ableton-part-1/", user_id: 1 },
    { name: "Using Ableton for DJing", url: "http://www.soundonsound.com/sos/jul10/articles/livetech_0710.htm", user_id: 3 },
    { name: "Ableton", url: "https://www.ableton.com/", user_id: 1 },
    { name: "What is sound?", url: "http://www.soundproofingcompany.com/soundproofing101/what-is-sound/", user_id: 1 },
    { name: "Using Sound", url: "https://helpx.adobe.com/audition/using/sound.html", user_id: 2 },
    { name: "DJTT - Gift Guide", url: "http://djtechtools.com/2015/12/09/holiday-gift-guide-for-djs-producers-2015-edition/", user_id: 3 },
    { name: "DJTT - Pan Pot", url: "http://djtechtools.com/2015/12/07/pan-pot-interview-recording-a-kalimba-for/", user_id: 1 },
    { name: "DJTT - Midi-mapped filter", url: "http://djtechtools.com/2015/12/03/use-midi-mapped-ableton-filter-mix-tracks/", user_id: 2 },
    { name: "DJTT - Dolby Atmos", url: "http://djtechtools.com/2015/11/24/dolby-atmos-coming-to-a-club-near-you/", user_id: 3 },
    { name: "DJTT - TB-303", url: "http://djtechtools.com/2015/12/02/history-tb-303-rolands-accidental-legend/", user_id: 1 },
    { name: "DJTT - Pioneer DJM", url: "http://djtechtools.com/2015/11/23/pioneer-djm-s9-review-new-hybrid-battle-mixer/", user_id: 2 },
    { name: "DJTT - Warmup DJs", url: "http://djtechtools.com/2015/11/20/warmup-djs-play-to-the-crowd/", user_id: 3 },
  ]
)

#this code was sourced from Tyson Henry
articles.each do |article|
 
  # create tags
  for i in 0..rand(4)
    random_tag_string = gen_tag
    Tag.create(article_id: article.id, str: random_tag_string)
  end
end
