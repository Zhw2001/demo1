
const constRoutes = [
  {
    path:'/login',
    name:'login',
    component: () => import('@/views/login')
  },
  {
    path:'/regist',
    name:'regist',
    component: () => import('@/views/regist')
  },
  {
    path:'/about',
    name:'About',
    component: () => import('@/views/About')
  }
]

const allDynamicRoutes = [
  { id: '1', name: 'ea', title: '考核内容合理性审核', icon: 'el-icon-s-check', key:'EA' },
  { id: '2', parent_id: '1', name: 'ea_input', title: '考试/考核信息', path: 'eaInput', component: '/examAudit/view/ExamAudit', key:'EA_Input', pic: 'KSKHXX.png' },
  { id: '3', name: 'cgd', title: '课程目标成绩明细', icon: 'el-icon-data-line', key:'CGD' },
  { id: '4', parent_id: '3', name: 'cgd_input', title: '课程成绩录入', path: 'cgdInput', component: '/courseGoalDetail/view/AddData', key:'CGD_Input', pic:'KCCJLR.png' },
  { id: '5', name: 'ade', title: '课程目标达成度评价', icon: 'el-icon-s-check', key:'ADE' },
  { id: '6', parent_id: '5', name: 'ade_input', title: '达成度评价信息', path: 'cdInput', component: '/achieveDegreeEvalution/view/CourseDegree', key:'ADE_Input', pic:'DCDPJXX.png' },
  { id: '7', name: 'my_course', title: '我的历史课程信息', icon: 'el-icon-document-copy', key:'MyCourse' },
  { id: '8', parent_id: '7', name: 'course_info_list', title: '课程列表', path: 'cInfo', component: '/myCourse/view/courseInfoList', key:'Latest_C_Info', pic: 'KCLB.png' },
  { id: '9', parent_id: '7', name: 'achieve_detail_info', title: '课程目标明细', path: 'cAD', component: '/myCourse/view/courseAD', key:'Latest_A_Detail', pic: 'KCMBMX.png' },
  { id: '10', name: 'user', title: '用户管理', icon: 'el-icon-user', key:'User' },
  { id: '11', parent_id: '10', name: 'user_info', title: '用户信息', path: 'userInfo', component: '/user/view/user', key:'UserInfo', pic: 'YHXX.png' },
  { id: '12', parent_id: '10', name: 'user_role', title: '用户角色', path: 'userRole', component: '/user/view/userRole', key:'UserRole', pic: 'YHJS.png' },
  { id: '13', parent_id: '10', name: 'user_auth', title: '用户权限', path: 'userRoleMenu', component: '/user/view/userRoleMenu', key:'UserAuth', pic: 'YHQX.png' },
  { id: '14', parent_id: '10', name: 'user_course', title: '分配课程', path: 'userCourse', component: '/user/view/userCourse', key:'UserCourse', pic: 'FPKC.png' }
]

export { allDynamicRoutes, constRoutes }