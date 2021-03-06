# coding: utf-8

module ApplicationHelper
  
  def controller?(*controller)
     controller.include?(params[:controller])
   end

   def action?(*action)
     action.include?(params[:action])
   end
  
  def date_with_month(date)
    I18n.localize(date, :format => :with_month)
  end
  
  def date_without_time(date)
    I18n.localize(date, :format => :without_time)
  end
  
  def link_to_delete_comment(user, comment)
    link_to 'удалить', comment_path(comment), :method => :delete, :confirm => 'Вы уверены?' if comment.author_id == user.id
  end
  
  def users
    User.where('firstname != ?', 'admin')
  end
  
  def categories_list
    Category.all
  end
  
  def side_articles
    Article.limit(5)
  end
  
  def random_article
    Article.all.sample
  end
  
  def countries
    Country.all
  end
  
  def cities
    Citi.all
  end
  
  def tags
    Tag.all
  end
  
  def organization_title(user)
    # if user.organization && Organization.exists?(user.organization) && user.organization.title
      user.organization.title
    # end
  end
  
  def country(object)
    if object && Country.exists?(object)
      country = Country.find(object)
      country.try(:name)
    end
  end
  
  def city(object)
    if object && City.exists?(object)
      country = City.find(object)
      country.try(:name)
    end
  end
    
end
