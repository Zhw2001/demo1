
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
  { id: '1', name: 'ea', title: '内容合理性审核', icon: 'el-icon-edit', key:'EA' },
  { id: '2', parent_id: '1', name: 'ea_input', title: '考核信息填写', path: 'eaInput', component: '/examAudit/view/ExamAudit', key:'EA_Input' },
  { id: '3', name: 'cgd', title: '课程目标成绩明细', icon: 'el-icon-user', key:'CGD' },
  { id: '4', parent_id: '3', name: 'cgd_input', title: '课程成绩录入', path: 'cgdInput', component: '/courseGoalDetail/view/AddData', key:'CGD_Input' },
  { id: '5', name: 'ade', title: '课程目标达成度评价', icon: 'el-icon-data-analysis', key:'ADE' },
  { id: '6', parent_id: '5', name: 'ade_input', title: '目标信息填写', path: 'cdInput', component: '/achieveDegreeEvalution/view/CourseDegree', key:'ADE_Input' },
  { id: '7', name: 'my_course', title: '我的历史课程信息', icon: 'el-icon-data-analysis', key:'MyCourse' },
  { id: '8', parent_id: '7', name: 'course_info_list', title: '课程列表', path: 'cInfo', component: '/myCourse/view/courseInfoList', key:'Latest_C_Info' },
  { id: '9', parent_id: '7', name: 'achieve_detail_info', title: '课程目标明细', path: 'cAD', component: '/myCourse/view/courseAD', key:'Latest_A_Detail' },
  { id: '10', name: 'user', title: '用户管理', icon: 'el-icon-data-analysis', key:'User' },
  { id: '11', parent_id: '10', name: 'user_info', title: '用户信息', path: 'userInfo', component: '/user/view/user', key:'UserInfo' },
  { id: '12', parent_id: '10', name: 'user_role', title: '用户角色', path: 'userRole', component: '/user/view/userRole', key:'UserRole' },
  { id: '13', parent_id: '10', name: 'user_auth', title: '用户权限', path: 'userRoleMenu', component: '/user/view/userRoleMenu', key:'UserAuth' }
]

export { allDynamicRoutes, constRoutes }