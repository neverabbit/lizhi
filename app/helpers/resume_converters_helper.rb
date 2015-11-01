module ResumeConvertersHelper
  
  def convert_resume(file)
    if File.extname(file.original_filename) == ".htm"
	  
  		f = File.open(file.tempfile)
      doc = Nokogiri::HTML(f)
      f.close
		
  		basic_info = []
  		doc.css(".resume-basic-info tr td").each do |b|
  			basic_info << b.content.match(/.+/).to_s
  		end
		
		
  		name = basic_info.first.delete("姓名：").match(/\S+/).to_s
      gender = basic_info[1].delete("性别：").match(/\S/).to_s
      age = basic_info[3].delete("年龄：").match(/\d+/).to_s
		
  		marriage = basic_info[7][5..-1]
  		city = basic_info[9].delete("所在地：").match(/\S+/).to_s
		
      # txt = File.new("output/"+name+".txt", "w+")
  		resume_actuality_raw = doc.css(".buttons ~ table").first
      salary_now = ""
  		if resume_actuality_raw.nil?
		
  		else
  			actuality_details = resume_actuality_raw.css("tr td")
  			if actuality_details.empty?
			
  			else
  				actuality_details.each do |a|
            if /目前薪资/ =~ a.content.gsub(/\n\r/, "")
  				    salary_now = a.content.gsub(/\n\r/, "").delete("目前薪资：")
            end
            # txt.puts(a.content.gsub(/\n\r/, ""))
  				end
  			end
  		end
		
  		resume_expectation_raw = doc.css(".buttons ~ table").last
      salary_expect = ""
  		if resume_expectation_raw.nil?
		
  		else
  			expectation_details = resume_expectation_raw.css("tr td")
  			if expectation_details.empty?
			
  			else
  				expectation_details.each do |e|
            if /期望月薪/ =~ e.content.gsub(/\s\s+/, "")
              salary_expect = e.content.gsub(/\s\s+/, "")[5..-1]
            end
            # txt.puts(e.content.gsub(/\s\s+/, ""))
  				end
  			end
  		end
	
  		####### Work experience
  		resume_experience_raw = doc.css("#workexp_anchor")
    
      experience_worktime = resume_experience_raw.css(".work-time")
      experience_work_time = []
      experience_worktime.each do |t|
        experience_work_time << t.content
      end
      experience_company_raw = resume_experience_raw.css(".compony")
      experience_company = []
      experience_company_raw.each do |t|
        experience_company << t.content.match(/\S+/).to_s
      end
      experience_list_raw = resume_experience_raw.css(".job-list tr th[colspan='2']")
      experience_city_list = []
      experience_report_list = []
      experience_lead_list = []
      experience_list_raw.each do |t|
        experience_city_raw = t.content.match(/所在地区.*?[\|\n]/)
        experience_report_raw = t.content.match(/汇报对象.*?[\|\n]/)
        experience_lead_raw = t.content.match(/下属人数.*?[\|\n]/)
      
        experience_city = experience_city_raw.nil? ? '' : experience_city_raw.to_s[5..-2]
        experience_city_list << experience_city
        experience_report = experience_report_raw.nil? ? '' : experience_report_raw.to_s[5..-2]
        experience_report_list << experience_report
        experience_lead = experience_lead_raw.nil? ? '' : experience_lead_raw.to_s[5..-2]
        experience_lead_list << experience_lead
      end
      experience_position_raw = resume_experience_raw.css(".job-list-title strong")
      experience_position = []
      experience_position_raw.each do |t|
        experience_position << t.content.match(/\S+/).to_s
      end
      experience_responsibility_raw = resume_experience_raw.css(".nowrap + td")
      experience_responsibility = []
      experience_responsibility_raw.each do |t|
        experience_responsibility << t.content
      end
      experience_responsibility.select!.with_index { |_, i| i.even? }
		
  		####### Project
      resume_project_raw = doc.css(".resume-project .project-list")
      resume_project = []
      resume_project_raw.each do |p|
        project_time = p.css("tr div span").first.nil? ? "" : p.css("tr div span").first.content
        project_name = p.css("tr div strong").first.nil? ? "" : p.css("tr div strong").first.content
        project_list_raw = p.css("tr")
        project_position = ""
        project_company = ""
        project_intro = ""
        project_responsibility = ""
        project_list_raw.each do |l|
          if !l.css("th").first.nil? and /项目职务/ =~ l.css("th").first.content.to_s
            project_position = l.css("td").first.content.match(/\S+/).to_s
          end
          if !l.css("th").first.nil? and /所在公司/ =~ l.css("th").first.content.to_s
            project_company = l.css("td").first.content.match(/\S+/).to_s
          end
          if !l.css("th").first.nil? and /项目简介/ =~ l.css("th").first.content.to_s
            project_intro = l.css("td").first.content.match(/\S+/).to_s
          end
          if !l.css("th").first.nil? and /项目职责/ =~ l.css("th").first.content.to_s
            project_responsibility = l.css("td").first.content.match(/\S+/).to_s
          end
          # p project_position
        end
        # p project_position
        project_list = [project_time, project_name, project_position, project_company, project_intro, project_responsibility]
        resume_project << project_list
      end

  		####### Education
  		education_list = []
  		resume_education_raw = doc.css(".resume-education table")
  		# txt.puts(resume_education_raw)
  		if resume_education_raw.empty?
		
  		else
  			resume_education_raw.each do |e|
  				education_list_raw = e.css("tr td")
  				education_detail = []
  				unless education_list_raw.empty?
  					education_list_raw.each do |l|
  						education_detail << l.content.gsub(/\s\s+/, "")
  					end
  				end
  				education_list << education_detail
  			end
  		end
      education_time = []
      education_uni = []
      education_major = []
      education_graduation = []
      education_list.each do |detail|
        time = detail.first.match(/\d.*\d/).to_s
        education_time << time
        uni = detail.first.match(/\D+/).to_s[0..-2]
        education_uni << uni
        major = detail[1][3..-1]
        education_major << major
        graduation = detail[2][3..-1]
        education_graduation << graduation
        # puts graduation
      end
  		# txt.puts("\n\r")
  		# txt.puts(education_list)

  		####### Language
  		language_list = []
  		resume_language_raw = doc.css(".resume-language tr td")
  		unless resume_language_raw.nil?
  			resume_language_raw.each do |l|
  				language_list << l.content.gsub(/\s+/, "")
  			end
  		end	
      # txt.puts("\n\r")
      # txt.puts(language_list)  
		
  		####### Self_evaluation
  		evaluation = ""
  		resume_evaluation_raw = doc.css(".resume-comments tr td")
  		unless resume_evaluation_raw.empty?
  			evaluation = resume_evaluation_raw.first.content.gsub(/\s\s+/, "")
  		end
      # txt.puts("\n\r")
      # txt.puts(evaluation)
		
  		####### extra_info 
  		extra_info = ""
  		resume_extra_raw = doc.css(".resume-others tr td")
  		unless resume_extra_raw.empty?
  			extra_info = resume_extra_raw.first.content
  		end
      # txt.puts("\n\r")
      # txt.puts(extra_info.inspect)
		
		
		
      # txt.puts("\n\r")
      # txt.puts(basic_info)
      # txt.close
    
    
    
    
      # docx converter
      resume_docx = Docx::Document.open("#{Rails.root}/public/converter/template.docx")
    
      # resume_docx.bookmarks.each_pair do |bookmark_name, bookmark_object|
        # puts bookmark_name
        # puts bookmark_object
      # end
    
      # resume_docx.paragraphs.each do |p|
        # puts p
      # end
    
      resume_docx.bookmarks['name'].insert_text_after(name)
      resume_docx.bookmarks['gender'].insert_text_after(gender)
  		resume_docx.bookmarks['age'].insert_text_after(age)
  		resume_docx.bookmarks['marriage'].insert_text_after(marriage)
  		resume_docx.bookmarks['city'].insert_text_after(city)
      resume_docx.bookmarks['salary_now'].insert_text_after(salary_now)
      resume_docx.bookmarks['salary_expect'].insert_text_after(salary_expect)
    
      i = 0
      # resume_docx.bookmarks['education_time1'].insert_text_after(education_time[1])
      while i < education_time.length
        resume_docx.bookmarks['education_time' + i.to_s].insert_text_after(education_time[i])
        i += 1
      end
      # resume_docx.bookmarks['education_time4'].insert_text_after("2011 到 2012")
    
      i = 0
      while i < education_uni.length
        resume_docx.bookmarks['education_uni' + i.to_s].insert_text_after(education_uni[i])
        i += 1
      end
    
      i = 0
      while i < education_major.length
        resume_docx.bookmarks['education_major' + i.to_s].insert_text_after(education_major[i])
        i += 1
      end
    
      i = 0
      while i < education_graduation.length
        resume_docx.bookmarks['education_graduation' + i.to_s].insert_text_after(education_graduation[i])
        i += 1
      end
    
      i = 0
      # p experience_report_list
      while i < experience_company.length
        resume_docx.bookmarks['work_time' + i.to_s].insert_text_after(experience_work_time[i])
        resume_docx.bookmarks['work_company' + i.to_s].insert_text_after(experience_company[i])
        resume_docx.bookmarks['work_city' + i.to_s].insert_text_after(experience_city_list[i])
        resume_docx.bookmarks['work_position' + i.to_s].insert_text_after(experience_position[i])
        resume_docx.bookmarks['work_report' + i.to_s].insert_text_after(experience_report_list[i])
        resume_docx.bookmarks['work_lead' + i.to_s].insert_text_after(experience_lead_list[i])
        resume_docx.bookmarks['work_responsibility' + i.to_s].insert_text_after(experience_responsibility[i])
        i+=1
      end
    
      i = 0
      while i < resume_project.length
        resume_docx.bookmarks['project_time' + i.to_s].insert_text_after(resume_project[i][0])
        resume_docx.bookmarks['project_name' + i.to_s].insert_text_after(resume_project[i][1])
        resume_docx.bookmarks['project_position' + i.to_s].insert_text_after(resume_project[i][2])
        resume_docx.bookmarks['project_company' + i.to_s].insert_text_after(resume_project[i][3])
        resume_docx.bookmarks['project_intro' + i.to_s].insert_text_after(resume_project[i][4])
        resume_docx.bookmarks['project_responsibility' + i.to_s].insert_text_after(resume_project[i][5])
        i+=1
      end

      resume_docx.save("#{Rails.root}/public/converter/output/"+name+'.docx')
      return name
      
    else
		  
  	end
  end
  
end
