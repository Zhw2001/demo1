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

            <div v-if="VisList[0]">
              <h1 style="margin-top:8pt; margin-bottom:3.1pt;   page-break-inside:avoid; page-break-after:avoid; line-height:150%; widows:0; orphans:0; font-size:24pt">
                <span style="font-family:'Times New Roman'">
                  1.
                </span>
                <span style="font-family:'黑体'">
                  课程基本信息
                </span>
              </h1>
              <table class = "myAuditTable">
                <tr >
                  <td>
                    <span >
                      审核学期
                    </span>
                  </td>
                  <td >
                      <span>
                        {{basicInfo.AuditSemester}}
                      </span>
                  </td>
                  <td >
                      <span>
                        审核时间
                      </span>
                  </td>
                  <td>
                    <p>
                      <span>
                        {{basicInfo.AuditTime}}
                      </span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td>
                    <p>
                      <span>
                        课程名称
                      </span>
                    </p>
                  </td>
                  <td>
                    <p>
                      <span>
                        {{basicInfo.cname}}
                      </span>
                    </p>
                  </td>
                  <td>
                    <p>
                      <span>
                        课程号
                      </span>
                    </p>
                  </td>
                  <td>
                    <p>
                      <span>
                        {{basicInfo.info_cid}}
                      </span>
                    </p>
                  </td>
                </tr>
                <tr >
                  <td>
                    <p>
                      <span>
                        班级
                      </span>
                    </p>
                  </td>
                  <td>
                    <p>
                      <span>
                        {{basicInfo.class}}
                      </span>
                    </p>
                  </td>
                  <td>
                    <p>
                      <span>
                        考试
                      </span>
                      <span>
                        /
                      </span>
                      <span>
                        考查
                      </span>
                    </p>
                  </td>
                  <td >
                    <p >
                      <span>
                        {{basicInfo.testtype}}
                      </span>
                    </p>
                  </td>
                </tr>
              </table>
              <div><el-button type="text" @click="open">编辑</el-button></div>
            </div>

            <div v-if="VisList[1]">
              <h1 style="margin-top:8pt; margin-bottom:3.1pt;   page-break-inside:avoid; page-break-after:avoid; line-height:150%; widows:0; orphans:0; font-size:12pt">
                <span style="font-family:'Times New Roman'">
                  2.
                </span>
                <span style="font-family:'黑体'">
                  考核内容
                </span>
              </h1>
              <table class = "myAuditTable">
                <tr>
                  <td style="width:80px;">
                      <span >
                        课程目标
                      </span>
                  </td>
                  <td >
                    <div>
                      <span>{{testContent.ctarget[0]}}</span>
                    </div>
                    <div>
                      <span>{{testContent.ctarget[1]}}</span>
                    </div>
                    <div >
                      <span>{{testContent.ctarget[2]}}</span>
                    </div>
                    <div>
                      <span>{{testContent.ctarget[3]}}</span>
                    </div>
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
              <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:12pt">
                <span style="font-family:'Times New Roman'">
                  2.1
                </span>
                <span style="font-family:'黑体'">
                  考核比例
                </span>
              </p>
              <table cellspacing="0" cellpadding="0" style="width:426.85pt; border-collapse:collapse">
                <tr style="height:1pt">
                  <td rowspan="2" style="width:28.4pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        平时
                      </span>
                    </p>
                  </td>
                  <td style="width:82.65pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        考核方式：
                      </span>
                    </p>
                  </td>
                  <td style="width:82.55pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        考勤
                      </span>
                    </p>
                  </td>
                  <td style="width:56.2pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        课堂表现
                      </span>
                    </p>
                  </td>
                  <td style="width:56.55pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        作业
                      </span>
                    </p>
                  </td>
                  <td style="width:54.95pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        小计
                      </span>
                    </p>
                  </td>
                </tr>
                <tr style="height:1pt">
                  <td style="width:82.65pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        所占比例
                      </span>
                    </p>
                  </td>
                  <td style="width:82.55pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'; color:#1f497d">
                        {{calArray(testContent.ContentDis.Attendance)}}%
                      </span>
                    </p>
                  </td>
                  <td style="width:56.2pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'; color:#1f497d">
                        {{calArray(testContent.ContentDis.CPerformance)}}%
                      </span>
                    </p>
                  </td>
                  <td style="width:56.55pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'; color:#1f497d">
                        {{calArray(testContent.ContentDis.HomeWork)}}%
                      </span>
                    </p>
                  </td>
                  <td style="width:54.95pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'; color:#1f497d">
                        {{calArray(testContent.ContentDis.Attendance)+calArray(testContent.ContentDis.CPerformance)+calArray(testContent.ContentDis.HomeWork)}}%
                      </span>
                    </p>
                  </td>
                </tr>
                <tr style="height:1pt">
                  <td rowspan="2" style="width:28.4pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        期末
                      </span>
                    </p>
                  </td>
                  <td style="width:82.65pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        考核方式
                      </span>
                    </p>
                  </td>
                  <td style="width:82.55pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'仿宋'">
                        卷面考试
                      </span>
                    </p>
                  </td>
                  <td style="width:56.2pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'">
                        &#xa0;
                      </span>
                    </p>
                  </td>
                  <td style="width:56.55pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'">
                        &#xa0;
                      </span>
                    </p>
                  </td>
                  <td style="width:54.95pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'">
                        &#xa0;
                      </span>
                    </p>
                  </td>
                </tr>
                <tr style="height:1pt">
                  <td style="width:82.65pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        所占比例
                      </span>
                    </p>
                  </td>
                  <td style="width:82.55pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'">
                        70%
                      </span>
                    </p>
                  </td>
                  <td style="width:56.2pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'">
                        &#xa0;
                      </span>
                    </p>
                  </td>
                  <td style="width:56.55pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'">
                        &#xa0;
                      </span>
                    </p>
                  </td>
                  <td style="width:54.95pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'">
                        70%
                      </span>
                    </p>
                  </td>
                </tr>
                <tr style="height:1pt">
                  <td colspan="5" style="width:349.55pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'仿宋'">
                        合计
                      </span>
                    </p>
                  </td>
                  <td style="width:54.95pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'">
                        100%
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
              <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:12pt">
                <span style="font-family:'Times New Roman'">
                  2.2
                </span>
                <span style="font-family:'黑体'">
                  内容分布
                </span>
              </p>
              <table cellspacing="0" cellpadding="0" style="width:440.2pt; border-collapse:collapse">
                <tr>
                  <td rowspan="2" style="width:60.1pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        课程目标
                      </span>
                    </p>
                  </td>
                  <td rowspan="2" style="width:67.15pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        支撑毕业要求
                      </span>
                    </p>
                  </td>
                  <td colspan="4" style="width:230.2pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        考核方式与比例
                      </span>
                    </p>
                  </td>
                  <td rowspan="2" style="width:38.8pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        成绩比例
                      </span>
                    </p>
                  </td>
                </tr>
                <tr style="height:11.6pt">
                  <td style="width:38.85pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        考勤
                      </span>
                    </p>
                  </td>
                  <td style="width:45.9pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        课堂表现
                      </span>
                    </p>
                  </td>
                  <td style="width:45.9pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        作业
                      </span>
                    </p>
                  </td>
                  <td style="width:67.15pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        卷面考试
                      </span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td style="width:60.1pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        课程目标
                      </span>
                      <span style="font-family:Calibri">
                        1
                      </span>
                    </p>
                  </td>
                  <td style="width:67.15pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        毕业要求
                      </span>
                      <span style="font-family:Calibri">
                        2.
                      </span>
                      <span style="font-family:Calibri">
                        4
                      </span>
                    </p>
                  </td>
                  <td style="width:38.85pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        {{testContent.ContentDis.Attendance[0]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:45.9pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        {{testContent.ContentDis.CPerformance[0]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:45.9pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        {{testContent.ContentDis.HomeWork[0]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:67.15pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        {{this.testContent.ContentDis.Score[0]}}
                      </span>
                      <span style="font-family:Arial; font-size:7.5pt; color:#1f497d; background-color:#ffffff">
                        X
                      </span>
                      <span style="font-family:Calibri; color:#1f497d">
                        0.7
                      </span>
                      <span style="font-family:Calibri; color:#1f497d">
                        ={{setScore[0]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:38.8pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        {{setRatio[0]}}%
                      </span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td style="width:60.1pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        课程目标
                      </span>
                      <span style="font-family:Calibri">
                        2
                      </span>
                    </p>
                  </td>
                  <td style="width:67.15pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        毕业要求
                      </span>
                      <span style="font-family:Calibri">
                        3.3
                      </span>
                    </p>
                  </td>
                  <td style="width:38.85pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        {{testContent.ContentDis.Attendance[1]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:45.9pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; letter-spacing:0.1pt; color:#1f497d">
                        {{testContent.ContentDis.CPerformance[1]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:45.9pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        {{testContent.ContentDis.HomeWork[1]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:67.15pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; font-weight:bold; color:#1f497d">
                        <span style="font-family:Calibri; color:#1f497d">
                        {{this.testContent.ContentDis.Score[1]}}
                      </span>
                      <span style="font-family:Arial; font-size:7.5pt; color:#1f497d; background-color:#ffffff">
                        X
                      </span>
                      <span style="font-family:Calibri; color:#1f497d">
                        0.7
                      </span>
                      <span style="font-family:Calibri; color:#1f497d">
                        ={{setScore[1]}}
                      </span>
                      </span>
                    </p>
                  </td>
                  <td style="width:38.8pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        {{setRatio[1]}}%
                      </span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td style="width:60.1pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        课程目标
                      </span>
                      <span style="font-family:Calibri">
                        3
                      </span>
                    </p>
                  </td>
                  <td style="width:67.15pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        毕业要求
                      </span>
                      <span style="font-family:Calibri">
                        4.2
                      </span>
                    </p>
                  </td>
                  <td style="width:38.85pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        {{testContent.ContentDis.Attendance[2]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:45.9pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        {{testContent.ContentDis.CPerformance[2]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:45.9pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        {{testContent.ContentDis.HomeWork[2]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:67.15pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        {{this.testContent.ContentDis.Score[2]}}
                      </span>
                      <span style="font-family:Arial; font-size:7.5pt; color:#1f497d; background-color:#ffffff">
                        X
                      </span>
                      <span style="font-family:Calibri; color:#1f497d">
                        0.7
                      </span>
                      <span style="font-family:Calibri; color:#1f497d">
                        ={{setScore[2]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:38.8pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        {{setRatio[2]}}%
                      </span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td style="width:60.1pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        课程目标
                      </span>
                      <span style="font-family:Calibri">
                        4
                      </span>
                    </p>
                  </td>
                  <td style="width:67.15pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        毕业要求
                      </span>
                      <span style="font-family:Calibri">
                        5.3
                      </span>
                    </p>
                  </td>
                  <td style="width:38.85pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        {{testContent.ContentDis.Attendance[3]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:45.9pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        {{testContent.ContentDis.CPerformance[3]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:45.9pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        {{testContent.ContentDis.HomeWork[3]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:67.15pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        {{this.testContent.ContentDis.Score[3]}}
                      </span>
                      <span style="font-family:Arial; font-size:7.5pt; color:#1f497d; background-color:#ffffff">
                        X
                      </span>
                      <span style="font-family:Calibri; color:#1f497d">
                        0.7
                      </span>
                      <span style="font-family:Calibri; color:#1f497d">
                        ={{setScore[3]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:38.8pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                      {{setRatio[3]}}%
                      </span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td colspan="2" style="width:138.05pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        合计
                      </span>
                    </p>
                  </td>
                  <td style="width:38.85pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; letter-spacing:0.1pt; color:#1f497d">
                        {{setTotal[0]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:45.9pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; letter-spacing:0.1pt; color:#1f497d">
                        {{setTotal[1]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:45.9pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        {{setTotal[2]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:67.15pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        {{setTotal[3]}}
                      </span>
                    </p>
                  </td>
                  <td style="width:38.8pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:Calibri; color:#1f497d">
                        {{setTotal[4]}}
                      </span>
                      <span style="font-family:Calibri; color:#1f497d">
                        %
                      </span>
                    </p>
                  </td>
                </tr>
              </table>
              <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:12pt">
                <span style="font-family:'Times New Roman'">
                  &#xa0;
                </span>
              </p>
              <table cellspacing="0" cellpadding="0" style="width:438.5pt; border-collapse:collapse">
                <tr style="height:31.7pt">
                  <td style="width:51.25pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        课程目标
                      </span>
                    </p>
                  </td>
                  <td style="width:88.5pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        支撑毕业要求
                      </span>
                    </p>
                  </td>
                  <td style="width:67.15pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:7.8pt; margin-bottom:0pt;   line-height:150%; widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        考核方式
                      </span>
                    </p>
                  </td>
                  <td style="width:102.6pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:7.8pt; margin-bottom:0pt;   line-height:150%; widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        考试题目
                      </span>
                    </p>
                  </td>
                  <td style="width:74.25pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:7.8pt; margin-bottom:0pt;   line-height:150%; widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'黑体'">
                        成绩比例
                      </span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td style="width:51.25pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        课程目标
                      </span>
                      <span style="font-family:'Times New Roman'">
                        1
                      </span>
                    </p>
                  </td>
                  <td style="width:88.5pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        毕业要求
                      </span>
                      <span style="font-family:'Times New Roman'">
                        2.4
                      </span>
                    </p>
                  </td>
                  <td style="width:67.15pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        考勤、考试
                      </span>
                    </p>
                  </td>
                  <td style="width:102.6pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        大题一（
                      </span>
                      <span style="font-family:'Times New Roman'">
                        10
                      </span>
                      <span style="font-family:'宋体'">
                        分）、大题二（
                      </span>
                      <span style="font-family:'Times New Roman'">
                        15
                      </span>
                      <span style="font-family:'宋体'">
                        分）、大题三（
                      </span>
                      <span style="font-family:'Times New Roman'">
                        15
                      </span>
                      <span style="font-family:'宋体'">
                        分）
                      </span>
                    </p>
                  </td>
                  <td style="width:74.25pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'">
                        &#xa0;
                      </span>
                    </p>
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'">
                        3
                      </span>
                      <span style="font-family:'Times New Roman'">
                        5%
                      </span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td style="width:51.25pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        课程目标
                      </span>
                      <span style="font-family:'Times New Roman'">
                        2
                      </span>
                    </p>
                  </td>
                  <td style="width:88.5pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        毕业要求
                      </span>
                      <span style="font-family:'Times New Roman'">
                        3.3
                      </span>
                    </p>
                  </td>
                  <td style="width:67.15pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        课堂表现、作业
                      </span>
                    </p>
                  </td>
                  <td style="width:102.6pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'">
                        &#xa0;
                      </span>
                    </p>
                  </td>
                  <td style="width:74.25pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'">
                        &#xa0;
                      </span>
                    </p>
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'">
                        2
                      </span>
                      <span style="font-family:'Times New Roman'">
                        0%
                      </span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td style="width:51.25pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        课程目标
                      </span>
                      <span style="font-family:'Times New Roman'">
                        3
                      </span>
                    </p>
                  </td>
                  <td style="width:88.5pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        毕业要求
                      </span>
                      <span style="font-family:'Times New Roman'">
                        4.2
                      </span>
                    </p>
                  </td>
                  <td style="width:67.15pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        卷面考试
                      </span>
                    </p>
                  </td>
                  <td style="width:102.6pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        大题四（
                      </span>
                      <span style="font-family:'Times New Roman'">
                        32
                      </span>
                      <span style="font-family:'宋体'">
                        分）
                      </span>
                    </p>
                  </td>
                  <td style="width:74.25pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'">
                        &#xa0;
                      </span>
                    </p>
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'">
                        2
                      </span>
                      <span style="font-family:'Times New Roman'">
                        2.4%
                      </span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td style="width:51.25pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        课程目标
                      </span>
                      <span style="font-family:'Times New Roman'">
                        4
                      </span>
                    </p>
                  </td>
                  <td style="width:88.5pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        毕业要求
                      </span>
                      <span style="font-family:'Times New Roman'">
                        5.3
                      </span>
                    </p>
                  </td>
                  <td style="width:67.15pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        作业、卷面考试
                      </span>
                    </p>
                  </td>
                  <td style="width:102.6pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt; widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        大题五（
                      </span>
                      <span style="font-family:'Times New Roman'">
                        28
                      </span>
                      <span style="font-family:'宋体'">
                        分）
                      </span>
                    </p>
                  </td>
                  <td style="width:74.25pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'">
                        &#xa0;
                      </span>
                    </p>
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'">
                        22.6%
                      </span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td colspan="2" style="width:150.55pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:middle">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'宋体'">
                        合计
                      </span>
                    </p>
                  </td>
                  <td style="width:67.15pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'">
                        &#xa0;
                      </span>
                    </p>
                  </td>
                  <td style="width:102.6pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'">
                        &#xa0;
                      </span>
                    </p>
                  </td>
                  <td style="width:74.25pt; border-style:solid; border-width:0.75pt; padding-right:5.03pt; padding-left:5.03pt; vertical-align:top">
                    <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt">
                      <span style="font-family:'Times New Roman'">
                        1
                      </span>
                      <span style="font-family:'Times New Roman'">
                        00
                      </span>
                      <span style="font-family:'Times New Roman'">
                        %
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
            </div>

            <div v-if="VisList[2]">
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

            <div v-if="VisList[3]">
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
        v-if="setLogVis(0)"
        :visible = true
        title="提示"
        width="30%"
        @close = "close">
        <el-form label-position="left" label-width="80px" :model="basicInfo">
          <el-form-item label="审核学期">
            <el-input v-model="basicInfo.AuditSemester"></el-input>
          </el-form-item>
          <el-form-item label="审核时间">
            <el-input v-model="basicInfo.AuditTime"></el-input>
          </el-form-item>
          <el-form-item label="课程名称">
            <el-input v-model="basicInfo.cname"></el-input>
          </el-form-item>
          <el-form-item label="课程号">
            <el-input v-model="basicInfo.info_cid"></el-input>
          </el-form-item>
          <el-form-item label="班级">
            <el-input v-model="basicInfo.class"></el-input>
          </el-form-item>
          <el-form-item label="考试/考查">
            <el-input v-model="basicInfo.testtype"></el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="close">取 消</el-button>
          <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
        </span>
      </el-dialog>

    </div>
</template>

<script>

export default {
  name:'examAudit',

  data() {
    return {
      VisList: [ true, true, false, false ],
      dialogVis: false,
      basicInfo:{
        AuditSemester:'2018-2019-1',
        AuditTime:'2018年12月',
        cname:'操作系统',
        info_cid:'XX123',
        class:'计算机111,计算机123',
        testtype:'考试',
      },
      testContent:{
        ctarget:[
          '课程目标 1 ： 能运用操作系统的原理描述进程和线程，能分析影响处理调度、磁盘调度、存储器管理、文件管理和输入输出系统的因素，会对比不同解决方案 的优缺点， 给出结论',
          '课程目标 2 ： 在具体场景和任务有变化时，能针对新的用户目标和需求，设计新的处理机调度方案、存储器访问方案、文件分配方案或设备管理方案，并能分析解决方案在时间上或空间上的开销。',
          '课程目标 3 ： 能分析程序的并发性程度，用前趋图描述程序的并发执行 ，构建并发系统，能测算不同 的调度机制、信号量和同步机制、存储方式和置换算法下的时间和空间的成本。',
          '课程目标 4 ： 能就具体场景，模拟生产者消费者、磁盘调度、文件管理统或存储器管理的操作流程，设计系统，并能分析、对比不同操作方案的成本和局限性.' 
        ],
        ContentDis:{//内容分布
          Attendance:[7,0,0,0],//考勤
          CPerformance:[0,8,0,0],//课堂表现
          HomeWork:[0,12,0,3],//作业
          Score:[40,0,32,28],//卷面考试
          Ratio:[],//成绩比例
          Total:[],//合计
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
    open(){
      this.dialogVis = true
      console.log(this.setLogVis(0))
    },
    close(){
      this.dialogVis = false
    },
    setSpecify(event){
      if(event.target.checked == true){
        this.testSpecification[parseInt(event.target.id)-1] = 1;
      }
      else{
        this.testSpecification[parseInt(event.target.id)-1] = 0;
      }
    },
    calArray(array){
      var ans = 0;
      for (let i of array){
        ans = ans + i;
      }
      return ans;
    },
    GenerateCTarget(){
      var ct = new Array;
      var data = new Object;
      data.semester = 'xxxx-xxxx-x' //this.basicInfo.AuditSemester;
      data.date = this.basicInfo.AuditTime;
      data.course_name = this.basicInfo.cname;
      data.course_number = this.basicInfo.info_cid;
      data.classes = this.basicInfo.class;
      data.exam_type = this.basicInfo.testtype;
      data.course_goals = new Array;
      for(let i = 0; i<this.testContent.ctarget.length;i++){
        var tmpObj = new Object;
        tmpObj.description = this.testContent.ctarget[i];
        tmpObj.support_graduation_require="支撑毕业要求1,1";
        tmpObj.usual_evaluations =[
          "考勤",
          "课堂表现",
          "作业"
        ];
        tmpObj.end_evaluations=[
          "卷面考试"
        ];
        tmpObj.evaluation_distribution={
          "考勤": this.testContent.ContentDis.Attendance[i],
          "课堂表现": this.testContent.ContentDis.CPerformance[i],
          "作业": this.testContent.ContentDis.HomeWork[i],
          "卷面考试": this.testContent.ContentDis.Score[i]
        };
        tmpObj.standard = [
          this.markStandard.a[i],
          this.markStandard.b[i],
          this.markStandard.d[i],
          this.markStandard.f[i]
        ],
        tmpObj.exam_question = '对应题目';
        tmpObj.exam_proportion = this.testContent.ContentDis.Ratio[i];
        data.course_goals.push(tmpObj);
      };
      var tmpArray = this.testSpecification;
      tmpArray.push(this.passRatio);
      data.question_specification = tmpArray;
      data.question_setter = '命题人';
      data.question_reviewer = '审题人';
      console.log(data);
      return data;
    },
    send(){
      this.$request.post('/api_P/audit',this.GenerateCTarget());
    }
  },

  computed: {
      setScore: function(){
        for(let i = 0; i < this.testContent.ContentDis.Score.length;i++){
          this.testContent.ContentDis.Score[i] = this.testContent.ContentDis.Score[i] * 0.7;
          this.testContent.ContentDis.Score[i] =Math.round(this.testContent.ContentDis.Score[i]);
        }
        return this.testContent.ContentDis.Score;
      },
      setRatio: function(){
        for(let i = 0;i < this.testContent.ContentDis.Score.length;i++){
          this.testContent.ContentDis.Ratio.push(this.testContent.ContentDis.Attendance[i]+this.testContent.ContentDis.CPerformance[i]+this.testContent.ContentDis.HomeWork[i]+this.testContent.ContentDis.Score[i]);
        }
        return this.testContent.ContentDis.Ratio;
      },
      setTotal:function(){
        this.testContent.ContentDis.Total.push(this.calArray(this.testContent.ContentDis.Attendance));
        this.testContent.ContentDis.Total.push(this.calArray(this.testContent.ContentDis.CPerformance));
        this.testContent.ContentDis.Total.push(this.calArray(this.testContent.ContentDis.HomeWork));
        this.testContent.ContentDis.Total.push(this.calArray(this.testContent.ContentDis.Score));
        this.testContent.ContentDis.Total.push(this.calArray(this.testContent.ContentDis.Ratio));
        return this.testContent.ContentDis.Total;
      },
      setLogVis(i){return function(i){
        return this.dialogVis && this.VisList[i]
      }} 
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

.myAuditTable{
  border-collapse:collapse;
  width:80%;
}

.myAuditTable tr{
  height:80px;
}

.myAuditTable tr td{
  border-style:solid; border-width:0.75pt;
}

.myAuditTable tr td span{
  font-family:'黑体'; padding:2px;
}

.myAuditTable tr td div{
  padding: 10px;
  width: 100%;
}

</style>