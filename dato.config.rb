require 'byebug'

def localize(model, field)
  translations = I18n.available_locales.map do |locale|
    I18n.with_locale(locale) do
      [locale.to_sym, model.send(field)]
    end
  end

  Hash[*translations.flatten(1)]
end

logos = dato.logos.map do |logo|
  {
    name: logo.name,
    url: logo.url,
    image: logo.image.url(w: 280, fm: 'jpg')
  }
end

create_data_file("_data/logos.yml", :yaml, logos)

employees = dato.employees.map do |employee|
  {
    name: employee.name,
    description: localize(employee, 'description'),
    skills: localize(employee, 'skills'),
    photo: employee.photo.url(w: 300, fm: 'jpg')
  }
end

create_data_file("_data/employees.yml", :yaml, employees)

home_slides = dato.home_slides.map do |home_slide|
  {
    title: localize(home_slide, 'title'),
    description: localize(home_slide, 'description'),
    background: home_slide.background.url(w: 1024, fm: 'jpg')
  }
end

create_data_file("_data/home_slides.yml", :yaml, home_slides)

destinations = dato.destinations.map do |destination|
  gallery = destination.gallery.map do |image|
    image.url(w: 1024, h: 682, fit: 'crop', fm: 'jpg')
  end

  {
    id: destination.id,
    name: localize(destination, 'name'),
    intro: localize(destination, 'intro'),
    title: localize(destination, 'title'),
    description: localize(destination, 'description'),
    message: localize(destination, 'message'),
    venues_title: localize(destination, 'venues_title'),
    venues_description: localize(destination, 'venues_description'),
    activities_title: localize(destination, 'activities_title'),
    activities_description: localize(destination, 'activities_description'),
    message_short: localize(destination, 'message_short'),
    brochure_file: localize(destination, 'brochure_file'),
    download_brochure: localize(destination, 'download_brochure'),
    video: destination.video,
    photo: destination.photo.url(w: 480, h: 270, fit: 'crop', fm: 'jpg'),
    gallery: gallery
  }
end

create_data_file("_data/destinations.yml", :yaml, destinations)

activities = dato.activities.select do |activity|
  !activity.hidden
end.map do |activity|
  {
    id: activity.id,
    title: localize(activity, 'title'),
    description: localize(activity, 'description'),

    localization: localize(activity, 'localization'),
    included: localize(activity, 'included'),
    not_included: localize(activity, 'not_included'),
    contact: localize(activity, 'contact'),

    selected: activity.selected,
    language: activity.language,
    duration: activity.duration,
    pax: activity.pax,
    price: activity.price,
    tag: activity.tag,
    accesibility: activity.accesibility,
    destination: activity.destination.id,

    thumbnail: activity.photo1 && activity.photo1.url(w: 480, h: 270, fit: 'crop', fm: 'jpg'),

    photo1: activity.photo1 && activity.photo1.url(w: 1024, fm: 'jpg'),
    photo2: activity.photo2 && activity.photo2.url(w: 1024, fm: 'jpg'),
    photo3: activity.photo3 && activity.photo3.url(w: 1024, fm: 'jpg')
  }
end

create_data_file("_data/activities.yml", :yaml, activities)

directory "_posts" do
  dato.blog_posts.each do |article|
    filename = "#{article.publication_date.strftime("%Y-%m-%d")}-#{article.title.parameterize}.md"
    create_post filename do
      frontmatter(
        :yaml,
        layout: 'post',
        section: 'blog',
        locale: 'es',
        title: article.title,
        date: article.publication_date,
        tags: article.tags.map(&:name).join(' '),
        author: article.author.name,
        image: article.featured_image && article.featured_image.url(w: 1024, fm: 'jpg'),
        thumbnail: article.featured_image && article.featured_image.url(w: 105, fm: 'jpg'),
      )

      has_back_references = false

      text = article.content.gsub(/<!-- *image([0-9]+) *-->/) do |match, text|
        id = /image([0-9]+)/.match(match)[1].to_i - 1
        gallery = article.image_gallery.first

        if gallery
          has_back_references = true
          image = article.image_gallery.first.image[id]
          "![#{image.alt}](#{image.url})"
        else
          ""
        end
      end

      galleries = []

      unless has_back_references
        galleries = article.image_gallery.map do |gallery|
          images = gallery.image.map {|image| "![#{image.alt}](#{image.url})"}
          "\n\n\n\n### #{gallery.title}\n\n" + images.join("\n\n")
        end
      end

      content(text + galleries.join("\n") + "\n")
    end
  end
end
