<template>
    <div class="home-container">
      <div class="card">
        <div class="card-body">
          <div class='mydoc'>
            <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:15pt">
              <span style="font-family:'宋体'; font-weight:bold; letter-spacing:2pt">
                考试
              </span>
              <span style="font-family:'Times New Roman'; font-weight:bold; letter-spacing:2pt">
                /
              </span>
              <span style="font-family:'宋体'; font-weight:bold; letter-spacing:2pt">
                考核内容合理性审核
              </span>
            </p>

            <div v-if="docVis === 0">
              <h1 style="margin-top:8pt; margin-bottom:3.1pt;   page-break-inside:avoid; page-break-after:avoid; line-height:150%; widows:0; orphans:0; font-size:24pt">
                <span style="font-family:'Times New Roman'">
                  1.
                </span>
                <span style="font-family:'黑体'">
                  课程基本信息
                </span>
              </h1>
              <table class = "basicInfoTable">
                <tr >
                  <td>
                    <span >
                      审核学期
                    </span>
                  <td >
                      <span>
                        {{basicInfo.semester}}
                      </span>
                  </td>
                  <td >
                      <span>
                        审核时间
                      </span>
                  </td>
                  <td>
                      <span>
                        {{basicInfo.date}}
                      </span>
                  </td>
                </tr>
                <tr>
                  <td>
                      <span>
                        课程名称
                      </span>
                  </td>
                  <td>
                      <span>
                        {{basicInfo.course_name}}
                      </span>
                  </td>
                  <td>
                      <span>
                        课程号
                      </span>
                  </td>
                  <td>
                      <span>
                        {{basicInfo.course_number}}
                      </span>
                  </td>
                </tr>
                <tr >
                  <td>
                      <span>
                        班级
                      </span>
                  </td>
                  <td>
                      <span>
                        {{basicInfo.class}}
                      </span>
                  </td>
                  <td>
                      <span>
                        考试
                      </span>
                      <span>
                        /
                      </span>
                      <span>
                        考查
                      </span>
                  </td>
                  <td >
                      <span>
                        {{basicInfo.exam_type}}
                      </span>
                  </td>
                </tr>
              </table>
              <div><el-button type="text" @click="open(0)">编辑</el-button></div>
            </div>

            <div v-if="true">
              <el-form>
                <el-form-item>
                  <h1 style="margin-top:8pt; margin-bottom:3.1pt;   page-break-inside:avoid; page-break-after:avoid; line-height:150%; widows:0; orphans:0; font-size:24pt">
                    <span style="font-family:'Times New Roman'">
                      2.
                    </span>
                    <span style="font-family:'黑体'">
                      考核内容
                    </span>
                  </h1>
                  <table class = "CourseTargetTable">
                    <tr>
                      <td style="width:100px;">
                          <span >
                            课程目标
                          </span>
                      </td>
                      <td v-for ="(item, i) in cTargetForm.ctargets" :key="i">
                        <div>
                          课程目标{{i+1}}：{{item.value}}
                        </div>
                      </td>
                    </tr>
                  </table>
                  <div><el-button type="text" @click="open(1)">编辑</el-button></div>
                </el-form-item>
              </el-form>
            </div>
            <div  v-if="docVis === 2">
              <p style="margin-top:10px; margin-bottom:10px;   widows:0; orphans:0; font-size:20pt">
                <span style="font-family:'Times New Roman'">
                  2.1
                </span>
                <span style="font-family:'黑体'">
                  考核比例
                </span>
              </p>
              <table class = "ExamRatioTable" >
                <template v-for="(mod, i) in modForm.mods" >
                  <tr :key="i+'NAME'">
                    <td 
                      rowspan="2"
                    >
                      <span>
                        {{mod.name}}
                      </span>
                    </td>
                    <td>
                      <p>
                        <span>
                          考核方式
                        </span>
                      </p>
                    </td>
                    <td v-for="(partName,p_index) in mod.partNames" :key="mod.name+'NAME'+p_index">
                      <p>
                        <span>
                        {{partName}}
                        </span>
                      </p>
                    </td>
                    <td v-for="(item,block_index) in mod.emptyBlocks" :key="i+block_index+'NAME'"></td>
                    <td>
                    小计
                    </td>
                  </tr>
                  <tr :key="i+'RATIO'">
                    <td>
                      <p>
                        <span>
                          所占比例
                        </span>
                      </p>
                    </td>
                    <td v-for="(partRatio,r_index) in mod.partRatios" :key="mod.name+'RATIO'+r_index">
                      <p>
                        <span>
                        {{partRatio}}
                        </span>
                      </p>
                    </td>
                    <td v-for="(item,block_index) in  mod.emptyBlocks" :key="i+block_index+'RATIO'"></td>
                    <td>
                      <p>
                        <span>
                         {{mod.total}}%
                        </span>
                      </p>
                    </td>
                    
                  </tr>
                </template>
                  <tr>
                    <td>
                        <span>
                          合计
                        </span>
                    </td>
                    <td></td>
                    <td v-for="(item, block_index) in emptyBlocks" :key="block_index">
                    </td>
                    <td>
                      <p>
                        <span>
                          {{total}}%
                        </span>
                      </p>
                    </td>
                  </tr>
              </table>
              <div><el-button type="text" @click="open(2)">编辑</el-button></div>
              <p style="margin-top:0pt; margin-bottom:10px;   widows:0; orphans:0; font-size:20pt">
                <span style="font-family:'Times New Roman'">
                  2.2
                </span>
                <span style="font-family:'黑体'">
                  内容分布
                </span>
              </p>
              <table class="ContentDisTable">
                <tr>
                  <th>
                    <p>
                      <span>
                        课程目标
                      </span>
                    </p>
                  </th>
                  <th>
                    <p>
                      <span>
                        支撑毕业要求
                      </span>
                    </p>
                  </th>
                  <th>
                    <p>
                      <span>
                        考核方式
                      </span>
                    </p>
                  </th>
                  <th>
                    <p>
                      <span>
                        考试题目
                      </span>
                    </p>
                  </th>
                  <th>
                    <p>
                      <span>
                        成绩比例
                      </span>
                    </p>
                  </th>
                </tr>
                <tr v-for="(ctarget, index) in cTargetForm.ctargets" :key="index">
                  <td>
                    <p>
                      <span>
                        课程目标 {{index+1}}
                      </span>
                    </p>
                  </td>
                  <td>
                    <p>
                      <span>
                        支撑毕业要求 {{ctarget.support_graduation_require}}
                      </span>
                    </p>
                  </td>
                  <td>
                    <p>
                      <span  v-for ="part in ctarget.parts" :key="part+'e_part'">
                        {{part}}
                      </span>
                    </p>
                  </td>
                  <td>
                    <p>
                      <span v-for ="item in ctarget.content" :key="item+'e_item'" >
                        {{item}}
                      </span>
                    </p>
                  </td>
                  <td>
                    <p >
                      <span>
                        {{ctarget.total}}
                      </span>
                    </p>
                  </td>
                </tr>

                <tr>
                  <td colspan="2">
                    <p>
                      <span >
                        合计
                      </span>
                    </p>
                  </td>
                  <td>
                  </td>
                  <td>
                  </td>
                  <td>
                    <p>
                      <span>
                        {{ctotal}}%
                      </span>
                    </p>
                  </td>
                </tr>
              </table>
              <div><el-button type="text" @click="open(3)">编辑</el-button></div>
            </div>

            <div v-if="docVis === 3">
              <h1 style="margin-top:8pt; margin-bottom:3.1pt;   page-break-inside:avoid; page-break-after:avoid; line-height:150%; widows:0; orphans:0; font-size:12pt">
                <span style="font-family:'Times New Roman'">
                  3.
                </span>
                <span style="font-family:'黑体'">
                  评分
                </span>
                <span style="font-family:'黑体'">
                  标准
                </span>
              </h1>
              <table cellspacing="0" cellpadding="0" style="width:438.5pt; border-collapse:collapse">
                <tr style="height:15.6pt">
                  <td rowspan="3" style="width:30.05pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        课程目标
                      </span>
                    </p>
                  </td>
                  <td colspan="4" style="width:386.1pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        评分标准
                      </span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td style="width:88.45pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        优秀
                      </span>
                    </p>
                  </td>
                  <td style="width:81.3pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        良好
                      </span>
                    </p>
                  </td>
                  <td style="width:88.45pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        及格
                      </span>
                    </p>
                  </td>
                  <td style="width:95.5pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        不及格
                      </span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td style="width:88.45pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri">
                        90-100
                      </span>
                    </p>
                  </td>
                  <td style="width:81.3pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri">
                        75-89
                      </span>
                    </p>
                  </td>
                  <td style="width:88.45pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri">
                        60-
                      </span>
                      <span style="font-family:Calibri">
                        74
                      </span>
                    </p>
                  </td>
                  <td style="width:95.5pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri">
                        0-59
                      </span>
                    </p>
                  </td>
                </tr>
                <tr style="height:155.05pt">
                  <td style="width:30.05pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        课程目标
                      </span>
                      <span style="font-family:Calibri">
                        1
                      </span>
                    </p>
                  </td>
                  <td style="width:88.45pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt; widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'; color:#1f497d">
                        {{markStandard.a[0]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:88.45ptpt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt; widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'; color:#1f497d">
                        {{markStandard.b[0]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:88.45pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt; widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'; color:#1f497d">
                        {{markStandard.d[0]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:88.45ptpt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt; widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'; color:#1f497d">
                        {{markStandard.f[0]}}
                      </span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td style="width:30.05pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        课程目标
                      </span>
                      <span style="font-family:Calibri">
                        1
                      </span>
                    </p>
                  </td>
                  <td style="width:88.45pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt; widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'; color:#1f497d">
                        {{markStandard.a[1]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:88.45ptpt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt; widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'; color:#1f497d">
                        {{markStandard.b[1]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:88.45pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt; widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'; color:#1f497d">
                        {{markStandard.d[1]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:88.45ptpt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt; widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'; color:#1f497d">
                        {{markStandard.f[1]}}
                      </span>
                    </p>
                  </td>
                </tr>
                <tr >
                  <td style="width:30.05pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        课程目标
                      </span>
                      <span style="font-family:Calibri">
                        1
                      </span>
                    </p>
                  </td>
                  <td style="width:88.45pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt; widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'; color:#1f497d">
                        {{markStandard.a[2]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:88.45pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt; widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'; color:#1f497d">
                        {{markStandard.b[2]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:88.45pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt; widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'; color:#1f497d">
                        {{markStandard.d[2]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:88.45pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt; widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'; color:#1f497d">
                        {{markStandard.f[2]}}
                      </span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td style="width:30.05pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        课程目标
                      </span>
                      <span style="font-family:Calibri">
                        1
                      </span>
                    </p>
                  </td>
                  <td style="width:88.45pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt; widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'; color:#1f497d">
                        {{markStandard.a[3]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:88.45ptpt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt; widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'; color:#1f497d">
                        {{markStandard.b[3]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:88.45pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt; widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'; color:#1f497d">
                        {{markStandard.d[3]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:88.45ptpt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt; widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'; color:#1f497d">
                        {{markStandard.f[3]}}
                      </span>
                    </p>
                  </td>
                </tr>
              </table>
              <h1 style="margin-top:5pt; margin-bottom:0pt;   page-break-inside:avoid; page-break-after:avoid; line-height:150%; widows:0; orphans:0; font-size:12pt">
                <span style="font-family:'Times New Roman'">
                  &#xa0;
                </span>
              </h1>
              <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                <span style="font-family:Calibri">
                  &#xa0;
                </span>
              </p>
              <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                <span style="font-family:Calibri">
                  &#xa0;
                </span>
              </p>
            </div>

            <div v-if="docVis === 4">
              <h1 style="margin-top:5pt; margin-bottom:0pt;   page-break-inside:avoid; page-break-after:avoid; line-height:150%; widows:0; orphans:0; font-size:12pt">
                <span style="font-family:'Times New Roman'">
                  3.
                </span>
                <span style="font-family:'黑体'">
                  命题规范
                </span>
              </h1>
              <table cellspacing="0" cellpadding="0" style="width:417.25pt; border-collapse:collapse">
                <tr>
                  <td style="width:286.9pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        命题内容是否符合课程大纲
                      </span>
                    </p>
                  </td>
                  <td style="width:108pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span>
                        <input id='1' name="checkbox" type="checkbox"  @click="setSpecify"  checked=true />
                      </span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td style="width:286.9pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        命题难度是否符合教学实际
                      </span>
                    </p>
                  </td>
                  <td style="width:108pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        <input id='2' name="checkbox" type="checkbox"  @click="setSpecify"  checked=true />
                      </span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td style="width:286.9pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        题型结构是否符合多样化要求
                      </span>
                    </p>
                  </td>
                  <td style="width:108pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        <input id='3' name="checkbox" type="checkbox" @click="setSpecify"  checked=true />
                      </span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td style="width:286.9pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        题量是否符合考核时间要求
                      </span>
                    </p>
                  </td>
                  <td style="width:108pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        <input id='4' name="checkbox" type="checkbox" @click="setSpecify"  checked=true />
                      </span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td style="width:286.9pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        题意、用词、符号、图形是否规范
                      </span>
                    </p>
                  </td>
                  <td style="width:108pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        <input id='5' name="checkbox" type="checkbox" @click="setSpecify"  checked=true />
                      </span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td style="width:286.9pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'">
                        AB
                      </span>
                      <span style="font-family:'宋体'">
                        卷是否不雷同，且难度相同、题量相当
                      </span>
                    </p>
                  </td>
                  <td style="width:108pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        <input id='6' name="checkbox" type="checkbox" @click="setSpecify"  checked=true />
                      </span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td style="width:286.9pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        与上一届试卷的重复度是否低于
                      </span>
                      <span style="font-family:'Times New Roman'">
                        30%
                      </span>
                    </p>
                  </td>
                  <td style="width:108pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        <input id='7' name="checkbox" type="checkbox" @click="setSpecify"  checked=true />
                      </span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td style="width:286.9pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        期望通过考试的学生比例
                      </span>
                    </p>
                  </td>
                  <td style="width:108pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'; color:#1f497d">
                        {{this.passRatio}}%
                      </span>
                    </p>
                  </td>
                </tr>
              </table>
              <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                <span style="font-family:'Times New Roman'">
                  &#xa0;
                </span>
              </p>
              <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                <span style="font-family:'Times New Roman'">
                  &#xa0;
                </span>
              </p>
              <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                <span style="font-family:'Times New Roman'">
                  &#xa0;
                </span>
              </p>
              <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                <span style="font-family:'Times New Roman'">
                  &#xa0;
                </span>
              </p>
              <table cellspacing="0" cellpadding="0" style="width:437.75pt; border-collapse:collapse">
                <tr style="height:24.45pt">
                  <td style="width:51.3pt; padding-right:5.4pt; padding-left:5.4pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        命题教师：
                      </span>
                    </p>
                  </td>
                  <td style="width:74.25pt; padding-right:5.4pt; padding-left:5.4pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'; color:#c0504d">
                        刘晋
                      </span>
                    </p>
                  </td>
                  <td style="width:53pt; padding-right:5.4pt; padding-left:5.4pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        审核人：
                      </span>
                      <span style="font-family:'宋体'">
                      </span>
                    </p>
                  </td>
                  <td style="width:60.1pt; padding-right:5.4pt; padding-left:5.4pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'楷体'; color:#c0504d">
                        章夏芬
                      </span>
                    </p>
                  </td>
                  <td style="width:45.9pt; padding-right:5.4pt; padding-left:5.4pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        日期：
                      </span>
                    </p>
                  </td>
                  <td style="width:88.4pt; padding-right:5.4pt; padding-left:5.4pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'; color:#c0504d">
                        2018
                      </span>
                      <span style="font-family:'宋体'; color:#c0504d">
                        年
                      </span>
                      <span style="font-family:'Times New Roman'; color:#c0504d">
                        12
                      </span>
                      <span style="font-family:'宋体'; color:#c0504d">
                        月
                      </span>
                    </p>
                  </td>
                </tr>
              </table>
              <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                <span style="font-family:'Times New Roman'">
                  &#xa0;
                </span>
              </p>
            </div>

          </div>
          <div style="text-align:center;">
            <el-button @click = 'send()'>发送</el-button>
          </div>
        </div>
      </div>

      <el-dialog
        :visible ="dialogVis === 0"
        width="30%"
        @close = "close">
        <el-form :rules='basicInfoRules' label-position="left" label-width="100px" :model="basicInfo" ref="basicInfo"> 
          <el-form-item label="审核学期" prop="semester">
            <el-input v-model="basicInfo.semester"></el-input>
          </el-form-item>
          <el-form-item label="审核时间" prop="date">
            <el-input v-model="basicInfo.date"></el-input>
          </el-form-item>
          <el-form-item label="课程名称" prop="course_name">
            <el-input v-model="basicInfo.course_name"></el-input>
          </el-form-item>
          <el-form-item label="课程号" prop="course_number">
            <el-input v-model="basicInfo.course_number"></el-input>
          </el-form-item>
          <el-form-item label="班级" prop="classes">
            <el-input v-model="basicInfo.classes"></el-input>
          </el-form-item>
          <el-form-item label="考试/考查" prop="exam_type">
            <el-input v-model="basicInfo.exam_type"></el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="resetForm('basicInfo')">重置</el-button>
          <el-button type="primary" @click="submitForm('basicInfo')">确定</el-button>
        </span>
      </el-dialog>

      <el-dialog
        :visible ="dialogVis === 1"
        width="50%"
        @close = "close">
        <el-form label-position="left" :model="cTargetForm" ref="cTargetForm" >
          <el-form-item>
            <el-button style='float:left;' @click="addCTarget" size = 'mini' icon="el-icon-plus" circle></el-button>
          </el-form-item>
          <el-form-item
            v-for="(ctarget, index) in cTargetForm.ctargets"
            :label="'目标' + (index+1)"
            :key="index + 'value'"
            :prop="'ctargets.' + index + '.value'"
            :rules="{
              required: true, message: '不能为空', trigger: 'blur'
            }"
          >
          <div style='display:flex;flex-direction:row;flex-wrap: nowrap;'>
            <el-input style='flex:0 1 auto;' v-model="ctarget.value"></el-input>
            <div style = "width:10px;flex:1 0 auto;"></div>
            <el-button style='flex:0 1 auto;' type='text' @click="removeMod(ctarget)">删除</el-button>
          </div>
          </el-form-item>
          <el-form-item
            v-for="(ctarget, index) in cTargetForm.ctargets"
            :label="'目标' + (index+1) + '支撑毕业要求'"
            :key="index + 'sgr'"
            :prop="'ctargets.' + index + '.support_graduation_require'"
            :rules="{
              required: true, message: '不能为空', trigger: 'blur'
            }"
          >
            <el-input placeholder="1.1" style='width:50px;' v-model="ctarget.support_graduation_require"></el-input>
          </el-form-item>
          <el-form-item>
            <div style='display:flex;justify-content:flex-start;'>
              <el-button type="primary" @click="submitForm('cTargetForm')">确定</el-button>
              <el-button @click="resetForm('cTargetForm')">重置</el-button>
            </div>
          </el-form-item>
        </el-form>
      </el-dialog>

      <el-dialog
        :visible ="dialogVis === 2"
        width="40%"
        :showClose="false"
        >
        <template slot="title">
            <el-button icon="el-icon-back" size='mini' @click='Mback()'  circle></el-button>
        </template>
        <div style='display:flex;flex-direction:column;justify-content:space-between;'>
          <el-steps :active="step" finish-status="success" align-center>
            <el-step title="添加模块"></el-step>
            <el-step title="添加模块组成"></el-step>
            <el-step title="添加考试题目"></el-step>
            <el-step title="分配"></el-step>
          </el-steps>
          
          <template v-if='step === 0'>
            <div style='margin:10px;'><el-button @click="addMod()" size = 'mini' icon="el-icon-plus" circle></el-button></div>
            <el-form  label-position="left" :model="modForm" ref="modForm" >
              <el-form-item
                label="模块名"
                v-for="(item, index) in modForm.mods"
                :key="index"
                :prop="'mods.' + index + '.name'"
                :rules="modRules"
              >
              <div style='display:flex;flex-direction:row;flex-wrap: nowrap;'>
                <el-input style='flex:0 2 auto;' v-model="item.name"></el-input>
                <div style = "width:10px;flex:1 0 auto;"></div>
                <label style='flex:1 0 auto;' class='el-form-item__label' slot='label'>所占比例</label>
                <el-input onkeyup="value=value.replace(/[^\d]/g,'')" style='flex:0 2 auto;' v-model="item.ratio"></el-input>
                <div style = "width:10px;flex:1 0 auto;"></div>
                <el-button style='flex:0 0 auto;' type='text' @click="removeMod(item)">删除</el-button>
              </div>
              </el-form-item>
              <el-form-item >
                <el-button @click="resetForm('modForm')">重置</el-button>
              </el-form-item>
              <el-form-item>
                <div style='display:flex;justify-content:flex-end;'>
                  <el-button @click="Mnext('modForm')">NEXT</el-button>
                </div>
              </el-form-item>
            </el-form>
          </template>

          <template  v-if='step === 1'>
            <div  style='margin:10px;'><el-button @click="addPart()" size = 'mini' icon="el-icon-plus" circle></el-button></div>
            <el-form  label-position="left" :model="partForm" ref="partForm" >
              <el-form-item
                label="名称"
                v-for="(item, index) in partForm.parts"
                :key="index"
                :prop="'parts.' + index + '.name'"
                :rules="partRules"
              >
              <div style='display:flex;flex-direction:row;flex-wrap: nowrap;'>
                <el-input style='flex:0 2 auto;' v-model="item.name"></el-input>
                <div style = "width:10px;flex:1 0 auto;"></div>
                <label style='flex:1 0 auto;' class='el-form-item__label' slot='label'>所占比例</label>
                <el-input onkeyup="value=value.replace(/[^\d]/g,'')" style='flex:0 2 auto;' v-model="item.ratio"></el-input>
                <div style = "width:10px;flex:1 0 auto;"></div>
                <el-button style='flex:0 0 auto;' type='text' @click="removePart(item)">删除</el-button>
              </div>
              </el-form-item>
              <el-form-item >
                <el-button @click="resetForm('partForm')">重置</el-button>
              </el-form-item>
              <el-form-item>
                <div style='display:flex;justify-content:flex-end;'>
                  <el-button  @click="Mnext('partForm')">NEXT</el-button>
                </div>
              </el-form-item>
            </el-form>
          </template>

          <template v-if='step === 2'>
            <div style='margin:10px;'><el-button @click="addItem()" size = 'mini' icon="el-icon-plus" circle></el-button></div>
            <el-form label-position="left" :model="itemForm" ref="itemForm" >
              <el-form-item
                label="名称"
                v-for="(item, index) in itemForm.items"
                :key="index"
                :prop="'items.' + index + '.name'"
                :rules="itemRules"
              >
              <div style='display:flex;flex-direction:row;flex-wrap: nowrap;'>
                <el-input style='flex:0 2 auto;' v-model="item.name"></el-input>
                <div style = "width:10px;flex:1 0 auto;"></div>
                <label style='flex:1 0 auto;' class='el-form-item__label' slot='label'>分值:</label>
                <el-input onkeyup="value=value.replace(/[^\d]/g,'')" style='flex:0 2 auto;' v-model="item.score"></el-input>
                <div style = "width:10px;flex:1 0 auto;"></div>
                <el-button style='flex:0 0 auto;' type='text' @click="removeItem(item)">删除</el-button>
              </div>
              </el-form-item>
              <el-form-item >
                <el-button @click="resetForm('itemForm')">重置</el-button>
              </el-form-item>
              <el-form-item>
                <div style='display:flex;justify-content:flex-end;'>
                  <el-button  @click="Mnext('itemForm')">NEXT</el-button>
                </div>
              </el-form-item>
            </el-form>
          </template>

          <template v-if='step === 3'>
            <div style="margin:10px;"></div>
            <el-form label-position="left" :model="modForm" ref="modForm" >
              <el-tag size="small" style='margin:10px 0px 10px 0px;text-align:center;' type="info">分配模块组成部分</el-tag>
              <el-form-item
                v-for="(mod, i) in modForm.mods"
                :key="i"
              >
              <div style='display:flex;flex-direction:row;flex-wrap: nowrap;justify-content:space-evenly;'>
                <label style='flex:1 1 auto;' class='el-form-item__label' slot='label'>{{mod.name}}组成部分:</label>
                <el-checkbox-group style='flex:1 1 auto;' v-model="mod.partNames" >
                  <el-checkbox  v-for="(part,index) in partForm.parts" :key="part.name+i" :label='part.name' :disabled="!part.checklock"  @change="handlePartCheckChange(index)" ></el-checkbox>
                </el-checkbox-group>
              </div>
              </el-form-item>
              <el-form-item>
              <div style='display:flex;justify-content:flex-end;'><el-button size="mini" type="text" @click="partReset()">重置</el-button></div>
              </el-form-item>
              <el-tag size="small" style='margin:10px 0px 10px 0px;text-align:center;' type="info">选择考试题目所属部分</el-tag>
              <el-form-item label="考试题目所属的部分是:">
                <el-select multiple clearable v-model="fatherOfItem"  placeholder="" >
                  <el-option
                  v-for="part in partForm.parts"
                  :key = "part.name"
                  :label = "part.name"
                  :value = "part.name">
                  </el-option>
                </el-select>
              </el-form-item>
            </el-form>
            <div style='display:flex;justify-content:flex-end;'>
                <el-button  @click="ModFormConfirm()">确定</el-button>
            </div>
          </template>
        </div>
          
      </el-dialog>

      <el-dialog
        :visible ="dialogVis === 3"
        width="30%"
        @close = "close">
        <el-form label-position="left" :model="cTargetForm" ref="cTargetForm2" >
          <el-form-item
            v-for="(ctarget, index) in cTargetForm.ctargets"
            :key="index+'e_Type'"
          >
          <div style='display:flex;flex-direction:row;flex-wrap: nowrap;justify-content:space-evenly;'>
            <label style='flex:1 0 auto;' class='el-form-item__label' slot='label'>目标{{(index+1)}}考核方式:</label>
            <el-checkbox-group style='flex:1 1 auto;' v-model="ctarget.parts" >
              <el-checkbox  v-for="(part,i) in partForm.parts" :key="index+i+'TYPE'" :label='part.name' ></el-checkbox>
            </el-checkbox-group>
          </div>
          </el-form-item>
          <el-form-item>
              <div style='display:flex;justify-content:flex-end;'><el-button size="mini" type="text" @click="ctargetPartReset()">重置</el-button></div>
          </el-form-item>
          <el-form-item
            v-for="(ctarget, index) in cTargetForm.ctargets"
            :key="index+'e_Q'"
          >
          <div style='display:flex;flex-direction:row;flex-wrap: nowrap;justify-content:space-evenly;'>
            <label style='flex:1 0 auto;' class='el-form-item__label' slot='label'>目标{{(index+1)}}考试题目:</label>
            <el-checkbox-group style='flex:1 1 auto;' v-model="ctarget.content" >
              <el-checkbox  v-for="(item,i) in itemForm.items" :key="index+i+'Q'" :label='item.name' :disabled="!item.checklock"  @change="handleItemCheckChange(i)" ></el-checkbox>
            </el-checkbox-group>
          </div>
          </el-form-item>
          <el-form-item>
              <div style='display:flex;justify-content:flex-end;'><el-button size="mini" type="text" @click="itemReset()">重置</el-button></div>
              </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="CFormFinalConfirm()">确定</el-button>
          </el-form-item>
        </el-form>
      </el-dialog>


    </div>
</template>

<script>

export default {
  name:'examAudit',

  data() {
    var validateModName = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入模块'));
      } else if (this.modNameValidate(value) ) {
        callback(new Error('模块名不能相同!'));
      } else {
        callback();
      }
    };
    var validatePartName = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入名称'));
      } else if (this.partNameValidate(value) ) {
        callback(new Error('名称不能相同!'));
      } else {
        callback();
      }
    };
    var validateItemName = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入'));
      } else if (this.itemNameValidate(value) ) {
        callback(new Error('名称不能相同!'));
      } else {
        callback();
      }
    };
    return {
      total:0, //模块合计比例,calModTotal中计算
      ctotal:0, //课程目标合计比例
      emptyBlocks:[],
      step:0,
      fatherOfItem:[],
      docVis:2,
      dialogVis: -1,
      basicInfo: {
        semester:'2018-2019-1',
        date:'2018年12月',
        course_name:'操作系统',
        course_number:'XX123',
        classes:'计算机111,计算机123',
        exam_type:'考试',
      },
      basicInfoRules: {
        semester: [
          { required: true, message: '请输入学年', trigger: 'blur' },
        ],
        date: [
          { required: true, message: '请输入日期', trigger: 'blur' }
        ],
        course_name: [
          { required: true, message: '请输入课程名', trigger: 'blur' }
        ],
        course_number: [
          { required: true, message: '请输入课程号', trigger: 'blur' }
        ],
        classes: [
          { required: true, message: '请输入班级', trigger: 'blur' }
        ],
        exam_type: [
          { required: true, message: '请输入考试方式', trigger: 'blur' }
        ]
      },
      cTargetForm: {
        ctargets:[],
      },
      modForm: {
        mods:[]
      },
      partForm: {
        parts:[]
      },
      itemForm: {
        items:[]
      },
      modRules: {
        validator: validateModName, 
        trigger: 'change'
      },
      partRules: {
        validator: validatePartName, 
        trigger: 'change'
      },
      itemRules: {
        validator: validateItemName,
        trigger: 'change'
      },
      testContent:{
        ContentDis:{//内容分布
          Attendance:[7,0,0,0],//考勤
          CPerformance:[0,8,0,0],//课堂表现
          HomeWork:[0,12,0,3],//作业
          Score:[40,0,32,28],//卷面考试
          Ratio:[35,20,21,24],//成绩比例
          Total:[7,8,15,70,100],//合计
        }
      },
      markStandard:{
        a:[
          '能准确运用 操作系统的原理描述进程和线程，能准备分析影响处理调度、磁盘调度、存储器管理、文件管理和输入输出系统的因素，能准确对比不同解决方案 的优缺点 。',
          '针对新的用户目标和需求，能系统设计新的处理机调度方案、存储器访问方案、文件分配方案或设备管理方案，能合理分析解决方案在时间上或空间上的开销',
          '能准确分析程序的并发性程度，会用 前趋图描述程序的并发执行 ，构建完善的并发系统，能准备测算不同 的调度机制、信号量和同步机制、存储方式和置换算法下的时间和空间的成本',
          '就具体场景，能准确模拟生产者消费者、 磁盘调度 、文件管理 统 或存储器管理 的操作流程，设计系统，能准备分析、对比不同操作方案的成本和局限性',
        ],
        b:[
          '能合理运用 操作系统的原理描述进程和线程，能分析影响处理调度、磁盘调度、存储器管理、文件管理和输入输出系统的因素，会对比不同解决方案 的优缺点 。',
          '针对新的用户目标和需求，能设计合理的处理机调度方案、存储器访问方案、文件分配方案或设备管理方案，能分析解决方案在时间上或空间上的开销',
          '能合理分析程序的并发性程度，会用 前趋图描述程序的并发执行 ，构建并发系统，能测算不同 的调度机制、信号量和同步机制、存储方式和置换算法下的时间和空间的成本',
          '就具体场景，能合理模拟生产者消费者、 磁盘调度 、文件管理 统 或存储器管理 的操作流程，设计系统，能合理分析、对比不同操作方案的时间和空间成本',
        ],
        d:[
          '能运用 操作系统的原理描述进程和线程，基本能分析影响处理调度、磁盘调度、存储器管理、文件管理和输入输出系统的因素，基本上会对比不同解决方案 的优缺点 。',
          '针对新的用户目标和需求，基本能设计新的处理机调度方案、存储器访问方案、文件分配方案或设备管理方案，基本能分析解决方案在时间上或空间上的开销',
          '基本能分析程序的并发性程度，基本会用 前趋图描述程序的并发执行 ，能构建并发系统，基本能测算不同 的调度机制、信号量和同步机制、存储方式和置换算法下的时间和空间的成本',
          '就具体场景，基本能模拟生产者消费者、 磁盘调度 、文件管理 统 或存储器管理 的操作流程，设计系统，能基本分析、对比不同操作方案的成本和局限性',
        ],
        f:[
          '不能 分析影响处理调度、磁盘调度、存储器管理、文件管理和输入输出系统的因素，不能对比不同解决方案 的优缺点 。',
          '不能针对新的用户目标和需求设计新的处理机调度方案、存储器访问方案、文件分配方案或设备管理方案，不能分析解决方案在时间上或空间上的开销',
          '无法分析程序的并发性程度，不会用 前趋图描述程序的并发执行 ，不能能测算不同 的调度机制、信号量和同步机制、存储方式和置换算法下的时间和空间的成本',
          '能就具体场景，模拟生产者消费者、 磁盘调度 、文件管理 统 或存储器管理 的操作流程，设计系统，并能分析、对比不同操作方案的成本和局限性',
        ],
        c:[//中等
          '',
          '',
          '',
          '',
        ],
      },
      testSpecification:[1,1,1,1,1,1,1],
      passRatio:0,
    }
  },
  methods: {
    CFormFinalConfirm(){
      this.setCRatio()
      this.calCTargetTotal()
      this.close()
    },
    calCTargetTotal(){
      let temp = 0
      for(let i of this.cTargetForm.ctargets){
        temp = temp + parseInt(i.total)
      }
      this.ctotal = temp
    },
    setCRatio(){//计算每个课程目标所占的比例
      for(let i of this.cTargetForm.ctargets){
        let temp_total = 0
        let contentScore = 0
        for(let j of i.content){ //计算课程目标考试题目的总分
          for (let k = 0; k < this.itemForm.items.length; k++){
            if(this.itemForm.items[k].name == j){
              contentScore = contentScore + parseFloat(this.itemForm.items[k].score)
            }
          }
        }
        for(let j of i.parts){
          for (let k = 0; k < this.partForm.parts.length; k++){
            if(this.partForm.parts[k].name == j){//根据名字找到part总表中的part对象
              if(this.fatherOfItem.indexOf(j)!=-1){//需要将课程目标所具有的考试题目与其对应部分的比例相乘，才是此课程目标真正的比例
                let part_ratio = parseFloat(this.partForm.parts[k].ratio) / 100
                console.log('part_ratio',part_ratio)
                temp_total = temp_total + part_ratio * contentScore
              }else{
              temp_total = temp_total + parseFloat(this.partForm.parts[k].ratio)
              }
            }
          }
        }
        i.total = temp_total
      }
    },

    ModFormConfirm(){//模块填写最后一步确认
      this.setRatio()
      this.calModTotal()
      this.close()
      this.step = 0
    },
    setRatio(){
      console.log('SET')
      let max = 0
      for(let i of this.modForm.mods){
        let temp_total = 0
        if(i.partNames){
          max = (i.partNames.length > max ) ? i.partNames.length : max
        }
        for(let j of i.partNames){
          for (let k = 0; k < this.partForm.parts.length; k++){
            if(this.partForm.parts[k].name == j){
              i.partRatios.push(this.partForm.parts[k].ratio)
              temp_total = temp_total + parseFloat(this.partForm.parts[k].ratio)
            }
          }
        }
        i.total = temp_total
      }
      for(let i of this.modForm.mods){
        if(i.partNames){
          i.emptyBlocks = new Array(max - i.partNames.length+1).join('0').split('')
        }
      }

      let maxArry = []
      for( let i=0; i< max ;i++){
        maxArry.push(i)
      }
      this.emptyBlocks = maxArry
    },
    calModTotal(){
      let temp = 0
      for(let i of this.modForm.mods){
        temp = temp + parseInt(i.total)
      }
      this.total = temp
    },
    itemNameValidate(name){
      let count = 0
      for(let i = 0; i < this.itemForm.items.length; i++){
        if(this.itemForm.items[i].name === name){
          count = count + 1
          if(count > 1)return true
        }
      }
      return false
    },
    partNameValidate(name){
      let count = 0
      for(let i = 0; i < this.partForm.parts.length; i++){
        if(this.partForm.parts[i].name === name){
          count = count + 1
          if(count > 1)return true
        }
      }
      return false
    },
    modNameValidate(name){
      let count = 0
      for(let i = 0; i < this.modForm.mods.length; i++){
        if(this.modForm.mods[i].name === name){
          count = count + 1
          if(count > 1)return true
        }
      }
      return false
    },
    handlePartCheckChange(p_index){
      this.partForm.parts[p_index].checklock = !this.partForm.parts[p_index].checklock 
    },
    handleItemCheckChange(i_index){
      this.itemForm.items[i_index].checklock = !this.itemForm.items[i_index].checklock
    },
    itemReset(){
      for(let i of this.itemForm.items){
        i.checklock = true
      }
      for(let j of this.cTargetForm.ctargets){
        j.content = []
      }
    },
    partReset(){
      for(let i of this.partForm.parts){
        i.checklock = true
      }
      for(let j of this.modForm.mods){
        j.partNames = []
        j.partRatios = []
      }
    },
    ctargetPartReset(){
      for(let j of this.cTargetForm.ctargets){
        j.parts = []
      }
    },

    Mnext(formName){
      this.$refs[formName].validate((valid) => {
        if (valid) {
          if(this.step++ > 2) {//也许以后用的到
            this.step = 0
            this.$set(this.RatioVisList, this.step , true)
            this.close()
          }
        } else {
          console.log('error submit!!')
          return false
        }
      });
    },

    Mback(){
      if(this.step-- < 1) {
        this.step = 0
        this.close()
      }
    },

    //评分项编辑
    addItem(){
      this.itemForm.items.push(
        {
          name:'',
          score:0,
          checklock: true
        }
      )
    },
    removeItem(item){
      var index = this.itemForm.items.indexOf(item)
        if (index !== -1) {
          this.itemForm.items.splice(index, 1)
        }
    },

    //组成项编辑
    addPart(){
      this.partForm.parts.push(
        {
          name:'',
          ratio:0,
          checklock: true //true表示未占用
        }
      )
    },
    removePart(item){
      var index = this.partForm.parts.indexOf(item)
        if (index !== -1) {
          this.partForm.parts.splice(index, 1)
        }
    },

    //模块编辑
    addMod(){
      this.modForm.mods.push(
        {
          name:'',
          ratio:0,
          partNames: [],
          partRatios: [],
          emptyBlocks: [],
          total:0
        }
      )
    },
    removeMod(item){
      var index = this.modForm.mods.indexOf(item)
        if (index !== -1) {
          this.modForm.mods.splice(index, 1)
        }
    },

    //课程目标编辑
    removeCtarget(item){
      var index = this.cTargetForm.ctargets.indexOf(item)
        if (index !== -1) {
          this.cTargetForm.ctargets.splice(index, 1)
        }
    },
    addCTarget(){
      this.cTargetForm.ctargets.push({
        value: '',  //input框输入
        content: [],  //从checkbox中获取
        support_graduation_require: '', //手动输入
        parts:[],  //从checkbox中获取
        total:0 //最后计算，=parts中元素对应的比例之和
      });
    },

    //提交和重置,所有表单共用
    submitForm(formName){
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.close()
        } else {
          console.log('error submit!!')
          return false
        }
      });
    },
    resetForm(formName){
      this.$refs[formName].resetFields()
    },
    //所有编辑框的打开和关闭
    open(i){
      this.dialogVis = i
    },
    close(){
      this.dialogVis = -1
    },


    //流程规范赋值
    setSpecify(event){
      if(event.target.checked == true){
        this.testSpecification[parseInt(event.target.id)-1] = 1;
      }
      else{
        this.testSpecification[parseInt(event.target.id)-1] = 0;
      }
    },

    //求数组元素之和
    calArray(array){
      var ans = 0;
      for (let i of array){
        ans = ans + i;
      }
      return ans;
    },

    //生成接口数据对象
    GenerateCTarget(){
      var ct = new Array;
      var data = new Object;
      data.semester = 'xxxx-xxxx-x' //this.basicInfo.semester;
      data.date = this.basicInfo.date;
      data.course_name = this.basicInfo.course_name;
      data.course_number = this.basicInfo.course_number;
      data.classes = this.basicInfo.classes;
      data.exam_type = this.basicInfo.exam_type;
      data.course_goals = new Array;
      for(let i = 0; i<this.cTargetForm.ctargets.length;i++){
        var tmpObj = new Object;
        tmpObj.description = this.cTargetForm.ctargets[i].value
        tmpObj.support_graduation_require="支撑毕业要求1,1"
        tmpObj.usual_evaluations = this.testContent.modules //0-平时, 1-期末, 2-XXX
        tmpObj.end_evaluations=[
          "卷面考试"
        ]
        tmpObj.evaluation_distribution={
          "考勤": this.testContent.ContentDis.Attendance[i],
          "课堂表现": this.testContent.ContentDis.CPerformance[i],
          "作业": this.testContent.ContentDis.HomeWork[i],
          "卷面考试": this.testContent.ContentDis.Score[i]
        }
        tmpObj.standard = [
          this.markStandard.a[i],
          this.markStandard.b[i],
          this.markStandard.d[i],
          this.markStandard.f[i]
        ]
        tmpObj.exam_question = '对应题目'
        console.log( this.testContent.ContentDis)
        tmpObj.exam_proportion = this.testContent.ContentDis.Ratio[i]
        data.course_goals.push(tmpObj)
      }
      const tmpArray = JSON.parse(JSON.stringify(this.testSpecification))
      tmpArray.push(this.passRatio)
      data.question_specification = tmpArray
      data.question_setter = '命题人'
      data.question_reviewer = '审题人'
      console.log(data)
      return data;
    },
    //发送数据
    send(){
      this.$request.post('/api_P/audit',this.GenerateCTarget(),{responseType: "blob"}).then(res =>{
        console.log('11111111111',res)
        let blob = new Blob([res], {type: "application/msword"}); // 将服务端返回的文件流excel文件
        let fileName = `审核表${new Date().getTime()}.doc`; // 保存的文件名
        this.downLoadFile(blob, fileName); 
      });
    },
    //处理返回的二进制流
    downLoadFile (blob, fileName) {
      if (window.navigator.msSaveOrOpenBlob) { // IE10
          navigator.msSaveBlob(blob, fileName);
      } else {
          let link = document.createElement('a');
          link.style.display = 'none';
          link.href = URL.createObjectURL(blob); //创建一个指向该参数对象的URL
          link.download = fileName;
          link.click(); // 触发下载
          URL.revokeObjectURL(link.href); // 释放通过 URL.createObjectURL() 创建的 URL
      }
    }
  },

  //实时计算相关属性并更新
  computed: {
    modRatioValidate: function(){
      // if( this.calPartsRatio(this.partForm.parts) != this.modForm.mods
      console.log('setR')

    },
  },

}
</script>

<style scoped>

.mydoc{
  text-align: center;
}

.mydoc table{
  margin: auto;
}

.basicInfoTable{
  border-collapse:collapse;
  width:80%;
}

.basicInfoTable tr{
  height:80px;
}

.basicInfoTable tr td{
  border-style:solid;
  border-width:0.5pt;
}

.basicInfoTable tr td>span{ /*1. 课程基本信息*/
  font-family: "\4EFF\5B8B_GB2312";
  font-size: 20px;
}

.CourseTargetTable{
  border-collapse:collapse;
  width:80%;
}

.CourseTargetTable tr{
  height:80px;
}

.CourseTargetTable tr td{
  border-style:solid;
  border-width:0.5pt;
}

.CourseTargetTable tr td>span{ /*跨行表格*/
  font-family: "\4EFF\5B8B_GB2312";
  font-size: 20px;
}

.CourseTargetTable tr td>div{/*普通格子*/
  padding: 10px;
  width: 100%;
  font-size: 15px;
}

.ExamRatioTable{
  border-collapse:collapse;
  width:80%;
}

.ExamRatioTable tr{
  height:40px;
}

.ExamRatioTable tr td{
  border-style:solid;
  border-width:0.5pt;
}

.ExamRatioTable tr td>span{ /*跨行表格*/
  font-family: "\4EFF\5B8B_GB2312";
  font-size: 20px;
}

.ExamRatioTable tr td>p>span{/*普通格子*/
  padding: 10px;
  width: 100%;
  font-size: 15px;
}

.ContentDisTable{
  border-collapse:collapse;
  width:80%;
}

.ContentDisTable tr{
  height:30px;
}

.ContentDisTable tr th{
  border-style:solid;
  border-width:0.5pt;
}

.ContentDisTable tr td{
  border-style:solid;
  border-width:0.5pt;
}

.ContentDisTable tr th>p>span{ /*表头格子*/
  font-family: "\4EFF\5B8B_GB2312";
  font-size: 18px;
}

.ContentDisTable tr td>p>span{/*普通格子*/
  padding: 10px;
  width: 100%;
  font-size: 15px;
}

</style>