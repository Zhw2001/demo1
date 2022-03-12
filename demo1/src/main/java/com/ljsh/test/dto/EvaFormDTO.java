package com.ljsh.test.dto;

import lombok.Data;

@Data
public class EvaFormDTO {
        private Integer need_exam;
        private Integer miss_exam;
        private Integer poor_num;
        private Integer pass_num;
        private Integer normal_num;
        private Integer good_num;
        private Integer excellent_num;
        private Float pass_ratio;
        private Float excellent_ratio;

        public EvaFormDTO(Integer need_exam, Integer miss_exam, Integer poor_num, Integer pass_num, Integer normal_num, Integer good_num, Integer excellent_num, Float pass_ratio, Float excellent_ratio) {
                this.need_exam = need_exam;
                this.miss_exam = miss_exam;
                this.poor_num = poor_num;
                this.pass_num = pass_num;
                this.normal_num = normal_num;
                this.good_num = good_num;
                this.excellent_num = excellent_num;
                this.pass_ratio = pass_ratio;
                this.excellent_ratio = excellent_ratio;
        }

        public EvaFormDTO() {
        }
}
