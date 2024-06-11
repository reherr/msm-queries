class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id })

    @the_director = matching_records.at(0)

    render({ :template => "director_templates/details"})
  end

  def eldest

    eldest = Director.where.not({ :dob => nil }).order({ :dob => :asc })
     
    @eldest_found = eldest.at(0)

    birthday = @eldest_found.dob
    @birthday_formatted = birthday.strftime("%B %d, %Y")


    render({ :template => "director_templates/eldest" })
  end

  def youngest

    youngest = Director.where.not({ :dob => nil }).order({ :dob => :desc })

    @youngest_found = youngest.at(0)

    birthday = @youngest_found.dob
    @birthday_formatted = birthday.strftime("%B %d, %Y")

    render({ :template => "director_templates/youngest" })
  end
end
