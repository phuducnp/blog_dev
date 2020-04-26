class UsersDatatable
  delegate :params, :link_to, to: :@view
  # delegate :h

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: User.count,
      iTotalDisplayRecords: users.total_entries,
      aaData: data
    }
  end

  private
  def data
    users.map do |user|
      [
        # uncomment the code below if using delegate :h
        # ERB::Util.h(user.name),
        # ERB::Util.h(user.position),
        # ERB::Util.h(user.office),
        # ERB::Util.h(user.age)
        (user.name),
        (user.position),
        (user.office),
        (user.age)
      ]
    end
  end

  def users
    @users ||= fetch_users
  end

  def fetch_users
    users = User.order("#{sort_column} #{sort_direction}")
    users = users.page(page).per_page(per_page)
    if params[:sSearch].present?
      users = users.where("name like :search or position like :search or office like :search or age like :search", search: "%#{params[:sSearch]}%")
    end
    users
  end

  def page
    params[:iDisplayStart].to_i / per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name position office age]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
