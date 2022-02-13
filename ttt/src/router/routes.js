
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
]


const allDynamicRoutes = [
  { id: '1', name: 'generate', title: '工程认证', icon: 'el-icon-edit' },
  { id: '2', name: 'courseData', title: '课程数据', icon: 'el-icon-data-analysis' },
  { id: '3', name: 'userSetting', title: '用户管理', icon: 'el-icon-user' },
  { id: '4', parent_id: '1', name: 'AddData', title: '填写课程数据', path: 'addData', component: '/input/view/AddData' },
  { id: '5', parent_id: '1', name: 'ExamAudit', title: '考试考核内容合理性审核', path: 'examAudit', component: '/input/view/ExamAudit' },
  { id: '6', parent_id: '1', name: 'CourseDegree', title: '课程教学目标达成度评价', path: 'courseDegree', component: '/input/view/CourseDegree' },
  { id: '7', parent_id: '2', name: 'course', title: '查看与修改', path: 'course', component: '/course' },
  { id: '8', parent_id: '3', name: 'user', title: '用户信息', path: 'user', component: '/user/view/user' },
  { id: '9', parent_id: '3', name: 'userRoleMenu', title: '用户权限', path: 'userRoleMenu', component: '/user/view/userRoleMenu' }
]

export { allDynamicRoutes, constRoutes }