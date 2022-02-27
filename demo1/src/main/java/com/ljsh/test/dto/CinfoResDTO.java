package com.ljsh.test.dto;

import com.ljsh.test.domain.model.CDesign;
import com.ljsh.test.domain.model.Course;
import com.ljsh.test.domain.model.Exper;
import com.ljsh.test.domain.model.GDesign;
import lombok.Data;

import java.util.List;

@Data
public class CinfoResDTO {
    public CinfoResDTO(){}

    public CinfoResDTO(List<Course> course_list, List<Exper> exper_list, List<CDesign> cdesign_list, List<GDesign> gdesign_list) {
        this.course_list = course_list;
        this.exper_list = exper_list;
        this.cdesign_list = cdesign_list;
        this.gdesign_list = gdesign_list;
    }

    private List<Course> course_list;
    private List<Exper> exper_list;
    private List<CDesign> cdesign_list;
    private List<GDesign> gdesign_list;
}
