module PostsHelper
  def form_image_select(post)
    return image_tag post.image.url(:medium),
                     id: 'image-preview',
                     class: 'img-responsive' if post.image.exists?
    image_tag 'sign-in.jpg', id: 'image-preview', class: 'img-responsive'
  end

  def display_likes(post)
    votes = post.votes_for.up.by_type(User)
    return list_likers(votes) if votes.size <= 8
    count_likers(votes)
  end

  def liked_post(post)
    if current_user.voted_for? post
      return link_to '', unlike_post_path(post), remote: true, id: "like_#{post.id}",
                     class: "glyphicon glyphicon-heart"
    else
      link_to '', like_post_path(post), remote: true, id: "like_#{post.id}",
              class: "glyphicon glyphicon-heart-empty"
    end
  end

  private

  def list_likers(votes)
    user_names = []
    unless votes.blank?
      votes.voters.each do |voter|
        user_names.push(link_to voter.user_name,
                                profile_path(voter.user_name),
                                class: 'user-name')
      end
      user_names.to_sentence.html_safe + like_plural(votes)
    end
  end

  def count_likers(votes)
    vote_count = votes.size
    vote_count.to_s + ' likes'
  end

  def like_plural(votes)
    # If we more than one like for a post, use ' like this'
    return ' like this' if votes.count > 1
    # Otherwise, return ' likes this'
    ' likes this'
  end

end
