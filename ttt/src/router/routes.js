
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
  { id: '1', name: 'generate', title: '工程认证', icon: 'el-icon-edit', key:'generate' },
  { id: '2', name: 'courseData', title: '课程数据', icon: 'el-icon-data-analysis', key:'course' },
  { id: '3', name: 'userSetting', title: '用户管理', icon: 'el-icon-user', key:'user' },
  { id: '4', parent_id: '1', name: 'AD', title: '填写课程数据', path: 'addData', component: '/input/view/AddData', key:'addData' },
  { id: '5', parent_id: '1', name: 'EA', title: '考试考核内容合理性审核', path: 'examAudit', component: '/input/view/ExamAudit', key:'examAudit' },
  { id: '6', parent_id: '1', name: 'CD', title: '课程教学目标达成度评价', path: 'courseDegree', component: '/input/view/CourseDegree', key:'courseDegree' },
  { id: '7', parent_id: '2', name: 'C', title: '查看与修改', path: 'courseInfo', component: '/course', key:'courseInfo' },
  { id: '8', parent_id: '3', name: 'U', title: '用户信息', path: 'userInfo', component: '/user/view/user', key:'userInfo' },
  { id: '9', parent_id: '3', name: 'UR', title: '用户角色', path: 'userRole', component: '/user/view/userRole', key:'userRole' },
  { id: '10', parent_id: '3', name: 'URM', title: '用户权限', path: 'userRoleMenu', component: '/user/view/userRoleMenu', key:'userRoleMenu' }
]

export { allDynamicRoutes, constRoutes }