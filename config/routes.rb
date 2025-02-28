Rails.application.routes.draw do
  # Root route
  get("/", { :controller => "departments", :action => "index" })

  # ------------------------------
  # Department routes
  get("/departments", { :controller => "departments", :action => "index" })
  get("/departments/:path_id", { :controller => "departments", :action => "show" })
  post("/insert_department", { :controller => "departments", :action => "create" })
  patch("/modify_department/:path_id", { :controller => "departments", :action => "update" })
  delete("/delete_department/:path_id", { :controller => "departments", :action => "destroy" })

  # ------------------------------
  # Course routes
  get("/courses", { :controller => "courses", :action => "index" })
  get("/courses/:path_id", { :controller => "courses", :action => "show" })
  post("/insert_course", { :controller => "courses", :action => "create" })
  patch("/modify_course/:path_id", { :controller => "courses", :action => "update" })
  get("/delete_course/:path_id", { :controller => "courses", :action => "destroy" })

  # ------------------------------
  # Student routes
  get("/students", { :controller => "students", :action => "index" })
  get("/students/:path_id", { :controller => "students", :action => "show" })
  post("/insert_student", { :controller => "students", :action => "create" })
  patch("/modify_student/:path_id", { :controller => "students", :action => "update" })
  delete("/delete_student/:path_id", { :controller => "students", :action => "destroy" })

  # ------------------------------
  # Enrollment routes
  post("/insert_enrollment", { :controller => "enrollments", :action => "create" })
end
