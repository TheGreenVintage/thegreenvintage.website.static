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
    image: logo.image.url(w: 280)
  }
end

create_data_file("_data/logos.yml", :yaml, logos)

employees = dato.employees.map do |employee|
  {
    name: employee.name,
    description: localize(employee, 'description'),
    skills: localize(employee, 'skills'),
    photo: employee.photo.url(w: 300)
  }
end

create_data_file("_data/employees.yml", :yaml, employees)

home_slides = dato.home_slides.map do |home_slide|
  {
    title: localize(home_slide, 'title'),
    description: localize(home_slide, 'description'),
    background: home_slide.background.url(w: 1024)
  }
end

create_data_file("_data/home_slides.yml", :yaml, home_slides)

destinations = dato.destinations.map do |destination|
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
    photo: destination.photo.url(w: 480, h: 270, fit: "crop"),
  }
end

create_data_file("_data/destinations.yml", :yaml, destinations)

activities = dato.activities.map do |activity|
  {
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

    thumbnail: activity.photo1 && activity.photo1.url(w: 480, h: 270, fit: "crop"),

    photo1: activity.photo1 && activity.photo1.url(w: 1024),
    photo2: activity.photo2 && activity.photo2.url(w: 1024),
    photo3: activity.photo3 && activity.photo3.url(w: 1024)
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
        image: article.featured_image && article.featured_image.url(w: 1024),
        thumbnail: article.featured_image && article.featured_image.url(w: 105),
      )

      content(article.content)
    end
  end
end
