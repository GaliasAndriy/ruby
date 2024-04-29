class Author
    attr_reader :lastname, :firstname, :middlename
    @@authors = []

    def initialize(lastname, firstname, middlename = nil)
        if valid_name?(lastname) && valid_name?(firstname) && valid_name?(middlename)
        @lastname = lastname
        @firstname = firstname
        @middlename = middlename
        @@authors << self
        else
        @lastname = lastname
        @firstname = firstname
        @middlename = nil
        end
    end

    def self.authors
        @@authors
    end

    def to_s
        if @middlename
        "#{@lastname} #{@firstname} #{@middlename}"
        else
        "#{@lastname} #{@firstname}"
        end
    end

    private

    # validate name, up to 15 characters only
    def valid_name?(name)
        name =~ /^[a-zA-Zа-яА-ЯёЁїЇіІєЄґҐ\s-]{1,15}$/
    end
    end

    class Book
    attr_reader :authors, :title, :publisher, :year

    def initialize(authors, title, publisher, year)
        if valid_title?(title) && valid_publisher?(publisher) && valid_year?(year) && unique_authors?(authors)
            @authors = authors
            @title = title
            @publisher = publisher
            @year = year
        else
            @authors = []
            @title = nil
            @publisher = nil
            @year = nil
            puts "Error: Authors for the same book must be unique."
        end
    end

    def to_s
        author_names = @authors.map(&:to_s).join(", ")
        "Назва книги: #{@title}\nАвтор: #{author_names}\nВидавництво: #{@publisher}\nРік видання: #{@year}"
    end

    private

    # validate title
    def valid_title?(title)
        title =~ /^[a-zA-Zа-яА-ЯёЁїЇіІєЄґҐ\s\-,.;:0-9]+$/
    end

    def valid_publisher?(publisher)
        publisher =~ /^[a-zA-Zа-яА-ЯёЁїЇіІєЄґҐ\s\-,.;:0-9]+$/
    end

    # 4 digits
    def valid_year?(year)
        year =~ /^\d{4}$/ && year.to_i <= Time.now.year
    end

    def unique_authors?(authors)
        author_strings = authors.map { |author| [author.lastname, author.firstname, author.middlename] }
        author_strings.uniq.length == authors.length
    end
    end

    author1 = Author.new("Джоан", "Роулінг")
    # author2 = Author.new("Джоан", "Роулінг")

    book_authors = [author1]
    book1 = Book.new(book_authors, "Гаррі Поттер і філософський камінь", "А-БА-БА-ГА-ЛА-МА-ГА", "2050")

    puts book1
  