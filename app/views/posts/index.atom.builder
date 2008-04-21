atom_feed(:url => formatted_post_url(:atom)) do |feed|
  feed.title("faithfulgeek.org // agile web development")
  feed.updated(@posts.first ? @posts.first.created_at : Time.now.utc)

  for post in @posts
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(textilize(post), :type => 'html')

      entry.author do |author|
        author.name(post.author.name)
        author.email(post.author.email)
      end
    end
  end
end