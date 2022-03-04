<template>
  <div class="home-container">
    <div class="card">
      <div class="card-body">
        <div class="mydoc">
          <p
            style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:1vw;"
          >
            <span
              style="font-family:&#39;宋体&#39;; font-weight:bold; letter-spacing:2pt"
            >
              课程教学目标达成度评价
            </span>
          </p>
          <div v-if="docVis === 0">
            <h1 class="myTitle">1.课程基本信息</h1>
            <table class="basicInfoTable">
              <tr>
                <th>评价学期</th>
                <td colspan="2">{{basicInfo.semester}}</td>
                <td>评价时间</td>
                <td colspan="2">{{basicInfo.date}}</td>
              </tr>
              <tr>
                <th>课程名称</th>
                <td colspan="2">{{basicInfo.course_name}}</td>
                <td>课程性质</td>
                <td colspan="2">{{basicInfo.course_property}}</td>
              </tr>
              <tr>
                <th>考核班级</th>
                <td colspan="2">{{basicInfo.classes}}</td>
                <td>考试时间</td>
                <td colspan="2">{{basicInfo.exam_date}}</td>
              </tr>
              <tr>
                <th>课程学分</th>
                <td>{{basicInfo.course_point}}</td>
                <th>周学时</th>
                <td>{{basicInfo.week_hour}}</td>
                <th>总学时</th>
                <td>{{basicInfo.course_hour}}</td>
              </tr>
              <tr>
                <td colspan="6">学时分配</td>
              </tr>
              <tr>
                <th>课堂讲授</th>
                <td colspan="2">{{basicInfo.lesson_hour}}</td>
                <td>课程实践</td>
                <td colspan="2">{{basicInfo.practice_hour}}</td>
              </tr>
              <tr>
                <th>考核方式</th>
                <td colspan="5">{{basicInfo.exam_mode}}</td>
              </tr>
              <tr>
                <th>教材信息</th>
                <td colspan="5">{{basicInfo.text_book}}</td>
              </tr>
            </table>
          </div>
          <div v-if="docVis === 0">
            <h1 class="myTitle">2.评分标准</h1>
            <table class="basicInfoTable">
              <tr>
                <th>评定等级</th>
                <td>评分标准</td>
              </tr>
              <tr>
                <th>优秀</th>
                <td>{{standardForm.excellent}}</td>
              </tr>
              <tr>
                <th>良好</th>
                <td>{{standardForm.good}}</td>
              </tr>
              <tr>
                <th>中等</th>
                <td>{{standardForm.normal}}</td>
              </tr>
              <tr>
                <th>及格</th>
                <td>{{standardForm.pass}}</td>
              </tr>
              <tr>
                <th>不及格</th>
                <td>{{standardForm.poor}}</td>
              </tr>
            </table>
          </div>
          <div v-if="docVis === 0">
            <h1 class="myTitle">3.课程达成度评价</h1>
            <table class="basicInfoTable">
              <tr><th rowspan = '5'>总评成绩分布情况</th><td>应考人数:{{evaForm.need_exam}}</td><td>缺考人数:{{evaForm.miss_exam}}</td></tr>
              <tr><td>60分以下(不合格)人数:{{evaForm.poor_num}}</td><td>60-69分(合格)人数:{{evaForm.pass_num}}</td></tr>
              <tr><td>70-79分(中等)人数:{{evaForm.normal_num}}</td><td>80-89分(良好)人数:{{evaForm.good_num}}</td></tr>
              <tr><td>90-100分(优秀)人数:{{evaForm.excellent_num}}</td><td></td></tr>
              <tr><td>优秀率:{{evaForm.excellent_ratio}}%</td><td>及格率:{{evaForm.pass_ratio}}%</td></tr>
            </table>
            <table class="basicInfoTable" style="margin-top:2vw;">
              <tr><td colspan="2">学习目标</td><td colspan="5">学习任务的观测</td></tr>
              <tr><th>课程目标</th><th>支撑指标点</th><th>观测点</th><th>总分</th><th>期望值</th><th>实际值</th><th>达成度</th></tr>
              <tr v-for="(ctar,i) in cTARForm.ctargets" :key="i" ><td>课程目标{{i+1}}</td><td>{{ctar.graduate_require}}</td><td>{{ctar.eva_point}}</td><td>{{ctar.total_score}}</td><td>{{ctar.expectation}}</td><td>{{ctar.not_reach}}</td><td>{{ctar.achieve_degree}}</td></tr>
            </table>
          </div>
          <div v-if="docVis === 3">
            <h1 class="myTitle">4.基于达成度的分析和改进</h1>
            <p
              style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:&#39;Times New Roman&#39;">
                &nbsp;
              </span>
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt; text-indent:21pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span
                style="font-family:&#39;Times New Roman&#39;; color:#00b050"
              >
                2018-2019
              </span>
              <span
                style="font-family:&#39;Times New Roman&#39;; color:#00b050"
              >
                -1
              </span>
              <span style="font-family:&#39;宋体&#39;">
                学期的
              </span>
              <span style="font-family:&#39;宋体&#39;; color:#00b050">
                操作系统
              </span>
              <span style="font-family:&#39;宋体&#39;">
                考核结果分析如图
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                1
              </span>
              <span style="font-family:&#39;宋体&#39;">
                所示
              </span>
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:Calibri">
                &nbsp;
              </span>
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <img
                src="@/assets/img/ajt6m-5314a.001.png"
                width="495"
                height="290"
                alt=""
                style="-aw-left-pos:0pt; -aw-rel-hpos:column; -aw-rel-vpos:paragraph; -aw-top-pos:0pt; -aw-wrap-type:inline"
              />
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:&#39;宋体&#39;">
                图
              </span>
              <span style="font-family:Calibri">
                1.
              </span>
              <span style="font-family:Calibri; color:#00b050">
                2018-2019-1
              </span>
              <span style="font-family:&#39;宋体&#39;">
                学期
              </span>
              <span style="font-family:&#39;宋体&#39;; color:#00b050">
                操作系统
              </span>
              <span style="font-family:&#39;宋体&#39;">
                目标达成度
              </span>
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:Calibri">
                &nbsp;
              </span>
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt; text-indent:21pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:&#39;宋体&#39;">
                由图
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                1
              </span>
              <span style="font-family:&#39;宋体&#39;">
                可见，本学期的
              </span>
              <span style="font-family:&#39;宋体&#39;; color:#00b050">
                操作系统
              </span>
              <span style="font-family:&#39;宋体&#39;">
                课程，课程目标
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                1
              </span>
              <span style="font-family:&#39;宋体&#39;">
                的达成度最高为
              </span>
              <span
                style="font-family:&#39;Times New Roman&#39;; color:#00b050"
              >
                0.93
              </span>
              <span style="font-family:&#39;宋体&#39;">
                ，课程目标
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                4
              </span>
              <span style="font-family:&#39;宋体&#39;">
                的达成度最低，为
              </span>
              <span
                style="font-family:&#39;Times New Roman&#39;; color:#00b050"
              >
                0.76
              </span>
              <span style="font-family:&#39;宋体&#39;">
                。
              </span>
            </p>
            <p
              style="margin-top:10.9pt; margin-bottom:0pt; text-indent:21pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:&#39;宋体&#39;">
                课程目标
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                1
              </span>
              <span style="font-family:&#39;宋体&#39;">
                ，总分为
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                35
              </span>
              <span style="font-family:&#39;宋体&#39;">
                分，对应的是：运用
              </span>
              <span style="font-family:&#39;宋体&#39;">
                操作系统的原理描述进程和线程，分析影响处
              </span>
              <span style="font-family:&#39;宋体&#39;">
                理调度、磁盘调度、存储器管理、文件管理和输入输出系统的因素
              </span>
              <span style="font-family:&#39;宋体&#39;">
                ，对应的考核点是：平时的考勤
              </span>
              <span style="font-family:Calibri">
                +
              </span>
              <span style="font-family:&#39;宋体&#39;">
                试卷大题
              </span>
              <span style="font-family:Calibri">
                1+
              </span>
              <span style="font-family:&#39;宋体&#39;">
                试卷大题
              </span>
              <span style="font-family:Calibri">
                1+
              </span>
              <span style="font-family:&#39;宋体&#39;">
                试卷大题
              </span>
              <span style="font-family:Calibri">
                3
              </span>
              <span style="font-family:&#39;宋体&#39;">
                ，
              </span>
              <span style="font-family:&#39;宋体&#39;">
                成绩分布如下散列图
              </span>
              <span style="font-family:Calibri">
                2
              </span>
              <span style="font-family:&#39;宋体&#39;">
                所示。
              </span>
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <img
                src="@/assets/img/ajt6m-5314a.002.png"
                width="574"
                height="290"
                alt=""
                style="-aw-left-pos:0pt; -aw-rel-hpos:column; -aw-rel-vpos:paragraph; -aw-top-pos:0pt; -aw-wrap-type:inline"
              />
            </p>
            <p
              style="margin-top:7.8pt; margin-bottom:7.8pt;   line-height:150%; widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:&#39;宋体&#39;">
                图
              </span>
              <span style="font-family:Calibri">
                2.
              </span>
              <span style="font-family:&#39;宋体&#39;">
                “课程目标
              </span>
              <span style="font-family:Calibri">
                1
              </span>
              <span style="font-family:&#39;宋体&#39;">
                ”的成绩分布
              </span>
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt; text-indent:21pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:&#39;宋体&#39;">
                从图
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                2
              </span>
              <span style="font-family:&#39;宋体&#39;">
                可见：除了得
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                0
              </span>
              <span style="font-family:&#39;宋体&#39;">
                分的，课程目标
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                1
              </span>
              <span style="font-family:&#39;宋体&#39;">
                的得分的分布集中在
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                25
              </span>
              <span style="font-family:&#39;宋体&#39;">
                分
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                ~30
              </span>
              <span style="font-family:&#39;宋体&#39;">
                分的区域
              </span>
              <span style="font-family:&#39;宋体&#39;">
                。这是因为：这部分涉及
              </span>
              <span style="font-family:&#39;宋体&#39;">
                的是基本知识，
              </span>
              <span style="font-family:&#39;宋体&#39;">
                要求学
              </span>
              <span style="font-family:&#39;宋体&#39;">
                生参与课堂，并且能够描述和回答出操作系统的知识点
              </span>
              <span style="font-family:&#39;宋体&#39;">
                ，
              </span>
              <span style="font-family:&#39;宋体&#39;">
                难度相比较而言，比较简单。
              </span>
              <span style="font-family:&#39;宋体&#39;">
                均值，方差，最大，最小，中位线
              </span>
            </p>
            <p
              style="margin-top:10.9pt; margin-bottom:0pt; text-indent:21pt; widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:&#39;宋体&#39;">
                课程目标
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                2
              </span>
              <span style="font-family:&#39;宋体&#39;">
                ，总分为
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                20
              </span>
              <span style="font-family:&#39;宋体&#39;">
                分，对应的是：
              </span>
              <span style="font-family:&#39;宋体&#39;">
                处理机调度方案、存储器访问方案、文件分配方案或设备管理方案
              </span>
              <span style="font-family:&#39;宋体&#39;">
                ，成绩分布如下散列图
              </span>
              <span style="font-family:Calibri">
                3
              </span>
              <span style="font-family:&#39;宋体&#39;">
                所示。
              </span>
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <img
                src="@/assets/img/ajt6m-5314a.003.png"
                width="576"
                height="288"
                alt=""
                style="-aw-left-pos:0pt; -aw-rel-hpos:column; -aw-rel-vpos:paragraph; -aw-top-pos:0pt; -aw-wrap-type:inline"
              />
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:&#39;宋体&#39;">
                图
              </span>
              <span style="font-family:Calibri">
                3.
              </span>
              <span style="font-family:&#39;宋体&#39;">
                “课程目标
              </span>
              <span style="font-family:Calibri">
                2
              </span>
              <span style="font-family:&#39;宋体&#39;">
                ”的成绩分布
              </span>
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt; text-indent:21pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:&#39;宋体&#39;">
                从图
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                3
              </span>
              <span style="font-family:&#39;宋体&#39;">
                可见：除了得
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                0
              </span>
              <span style="font-family:&#39;宋体&#39;">
                分和极少数分数低于
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                10
              </span>
              <span style="font-family:&#39;宋体&#39;">
                分的，课程目标
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                2
              </span>
              <span style="font-family:&#39;宋体&#39;">
                的得分的分布相对集中
              </span>
              <span style="font-family:&#39;宋体&#39;">
                。这是因为：教师给出了
              </span>
              <span style="font-family:&#39;宋体&#39;">
                在具体场景和任务有变化时针对新的用户目标和需求设计
              </span>
              <span style="font-family:&#39;宋体&#39;">
                各种方案的
              </span>
              <span style="font-family:&#39;宋体&#39;">
                例子
              </span>
              <span style="font-family:&#39;宋体&#39;">
                ，学生理解其原理及需求，需要独立分析和设计的内容不多。在后续教学中，可以考虑增加学生的分析和设计。
              </span>
            </p>
            <p
              style="margin-top:10.9pt; margin-bottom:0pt; text-indent:21pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:&#39;宋体&#39;">
                课程目标
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                3
              </span>
              <span style="font-family:&#39;宋体&#39;">
                ，总分为
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                21
              </span>
              <span style="font-family:&#39;宋体&#39;">
                分，对应的是：程序的并发执行、不同的调度机制、信号量和同步机制、存储方式和置换算法下的时间和空间的成本，成绩分布如下散列图
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                4
              </span>
              <span style="font-family:&#39;宋体&#39;">
                所示。
              </span>
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <img
                src="@/assets/img/ajt6m-5314a.004.png"
                width="576"
                height="288"
                alt=""
                style="-aw-left-pos:0pt; -aw-rel-hpos:column; -aw-rel-vpos:paragraph; -aw-top-pos:0pt; -aw-wrap-type:inline"
              />
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:&#39;宋体&#39;">
                图
              </span>
              <span style="font-family:Calibri">
                4.
              </span>
              <span style="font-family:&#39;宋体&#39;">
                “课程目标
              </span>
              <span style="font-family:Calibri">
                3
              </span>
              <span style="font-family:&#39;宋体&#39;">
                ”的成绩分布
              </span>
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:&#39;Times New Roman&#39;">
                &nbsp;
              </span>
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt; text-indent:21pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:&#39;宋体&#39;">
                从图
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                4
              </span>
              <span style="font-family:&#39;宋体&#39;">
                可见：除了得
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                0
              </span>
              <span style="font-family:&#39;宋体&#39;">
                分的，课程目标
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                3
              </span>
              <span style="font-family:&#39;宋体&#39;">
                的得分的分布宽度比较大
              </span>
              <span style="font-family:&#39;宋体&#39;">
                。这是因为：这部分内容抽象程度高、设计编程难度大。
              </span>
            </p>
            <p
              style="margin-top:10.9pt; margin-bottom:0pt; text-indent:21pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:&#39;宋体&#39;">
                课程目标
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                4
              </span>
              <span style="font-family:&#39;宋体&#39;">
                ，总分为
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                24
              </span>
              <span style="font-family:&#39;宋体&#39;">
                分，对应的是：
              </span>
              <span style="font-family:&#39;宋体&#39;">
                生产者消费者、
              </span>
              <span style="font-family:&#39;宋体&#39;">
                磁盘调度
              </span>
              <span style="font-family:&#39;宋体&#39;">
                、文件管理
              </span>
              <span style="font-family:&#39;宋体&#39;">
                统
              </span>
              <span style="font-family:&#39;宋体&#39;">
                或存储器管理
              </span>
              <span style="font-family:&#39;宋体&#39;">
                ，
              </span>
              <span style="font-family:&#39;宋体&#39;">
                成绩分布如下散列图
              </span>
              <span style="font-family:Calibri">
                4
              </span>
              <span style="font-family:&#39;宋体&#39;">
                所示。
              </span>
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:&#39;Times New Roman&#39;">
                &nbsp;
              </span>
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:&#39;Times New Roman&#39;">
                &nbsp;
              </span>
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt; text-indent:21pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <img
                src="@/assets/img/ajt6m-5314a.005.png"
                width="576"
                height="288"
                alt=""
                style="-aw-left-pos:0pt; -aw-rel-hpos:column; -aw-rel-vpos:paragraph; -aw-top-pos:0pt; -aw-wrap-type:inline"
              />
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:&#39;宋体&#39;">
                图
              </span>
              <span style="font-family:Calibri">
                5.
              </span>
              <span style="font-family:&#39;宋体&#39;">
                “课程目标
              </span>
              <span style="font-family:Calibri">
                4
              </span>
              <span style="font-family:&#39;宋体&#39;">
                ”的成绩分布
              </span>
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt; text-indent:21pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:&#39;宋体&#39;">
                从图
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                4
              </span>
              <span style="font-family:&#39;宋体&#39;">
                可见：除了得
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                0
              </span>
              <span style="font-family:&#39;宋体&#39;">
                分的，课程目标
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                4
              </span>
              <span style="font-family:&#39;宋体&#39;">
                的得分的分布宽度比较大
              </span>
              <span style="font-family:&#39;宋体&#39;">
                。这是因为：这部分内容
              </span>
              <span style="font-family:&#39;宋体&#39;">
                要求学
              </span>
              <span style="font-family:&#39;宋体&#39;">
                生能对复杂计算机系统的运行进行测试和模拟，能分析系统、算法和工具的局限性，
              </span>
              <span style="font-family:&#39;宋体&#39;">
                难度
              </span>
              <span style="font-family:&#39;宋体&#39;">
                较大
              </span>
              <span style="font-family:&#39;宋体&#39;">
                。
              </span>
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:&#39;Times New Roman&#39;">
                &nbsp;
              </span>
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:&#39;Times New Roman&#39;">
                &nbsp;
              </span>
            </p>
            <p
              style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:&#39;宋体&#39;">
                课程评价人： 章夏芬
              </span>
              <span style="font-family:&#39;宋体&#39;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              </span>
              <span style="font-family:&#39;宋体&#39;">
                评价时间：
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                2019
              </span>
              <span style="font-family:&#39;宋体&#39;">
                年
              </span>
              <span style="font-family:&#39;Times New Roman&#39;">
                2
              </span>
              <span style="font-family:&#39;宋体&#39;">
                月
              </span>
            </p>
          </div>
        </div>
        <div style="margin-top:20px;text-align:center;">
          <el-button @click="back()">上一页</el-button>
          <el-button @click="next()">下一页</el-button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "courseDegree",

  data() {
    return {
      docVis: 0,
      basicInfo:{
        semester: "xxxx-xxxx-x",
        date: "xxxx年xx月",
        course_name: "课程名",
        course_property: "专业必修课",
        classes: "信管xxx,xxx",
        exam_date: "xxxx.xx.xx",
        course_point: "3",
        week_hour: '3',
        course_hour: '48',
        lesson_hour: '',
        practice_hour:'',
        exam_mode: "考查",
        text_book: "教材信息",
        appraiser:"评价人",
      },
      standardForm: {
        excellent: '',
        good: '',
        normal: '',
        pass: '',
        poor: ''
      },
      evaForm: {
        need_exam: 100,
        miss_exam: 2,
        poor_num: 5,
        pass_num: 18,
        normal_num: 34,
        good_num: 43,
        excellent_num: 14,
        pass_ratio: 96,
        excellent_ratio: 12,
      },
      cTARForm: {
        ctargets:[
          {
            id: '',
            graduate_require: '',
            eva_point: '',
            total_score: '',
            expectation: '',
            not_reach: '',
            achieve_degree: ''
          }
        ]
      },
      improveForm: {

      }
    };
  },
  methods: {
    back() {},
    next() {},

    mytable() {
      return this.$setCss.tableHeadCell;
    },
    mytableCell() {
      return this.$setCss.tableCell;
    }
  }
};
</script>

<style scoped>
.mydoc {
  text-align: center;
}

.mydoc table {
  margin: auto;
}

.myTitle {
  margin-top: 10px;
  margin-bottom: 10px;
  line-height: 150%;
  font-size: 1.7vw;
}

.mySecondTitle {
  margin-top: 10px;
  margin-bottom: 10px;
  font-size: 1.5vw;
}

.basicInfoTable {
  border-collapse: collapse;
  width: 80%;
}

.basicInfoTable tr {
  height: 3vw;
}

.basicInfoTable tr td {
  border-style: solid;
  border-width: 0.5pt;
  font-size: 1vw;
  padding: 10px;
}

.basicInfoTable tr th {
  border-style: solid;
  border-width: 0.5pt;
  width: 10%;
  font-size: 1vw;
  padding: 10px;
}
</style>