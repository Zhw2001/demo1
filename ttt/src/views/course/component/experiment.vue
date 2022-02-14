<template>
<div>
    <el-table       
    :fit = "true"
    size='mini'
    :header-cell-style = "mytable"
    :cell-style = "mytableCell"
    :data="currentPageData"     
    @select="Select"
    @select-all = "SelectAll">
        <el-table-column
        type="selection">
        </el-table-column>

        <el-table-column
        label="学年">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.stime" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.stime}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="课程编号">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.cid" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.cid}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="课程序号">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.cnum" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.cnum}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="学生编号">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.sid" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.sid}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="学生姓名">  
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.sname" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.sname}}</span>
            </template>
        </el-table-column>       

        <el-table-column
        label="学生专业">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.sclass" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.sclass}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="学生状态">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.sstate" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.sstate}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="p1">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.p1" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.p1}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="r1">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.r1" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.r1}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="p2">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.p2" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.p2}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="r2">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.r2" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.r2}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="p3">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.p3" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.p3}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="r3">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.r3" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.r3}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="p4">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.p4" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.p4}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="r4">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.r4" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.r4}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="p5">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.p5" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.p5}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="r5">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.r5" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.r5}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="p6">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.p6" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.p6}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="r6">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.r6" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.r6}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="r7">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.p7" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.p7}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="r7">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.r7" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.r7}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="p8">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.p8" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.p8}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="r8">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.r8" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.r8}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="regular">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.regular" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.regular}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="written">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.written" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.written}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="overall">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.overall" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.overall}}</span>
            </template>
        </el-table-column>

        <el-table-column label="操作">
        <template slot-scope="scope">
            <span class="my_button" v-if="!scope.row.selected" @click="edit(scope.row)">
                修改
            </span>
            <span class="my_button" v-else  @click="RowSave(scope.row)">
                保存
            </span>
            <span class="my_button" v-if="!scope.row.selected" @click="RowDel(scope.$index,scope.row)">
                删除
            </span>
            <span class="my_button" v-else  @click="cancel(scope.row)">
                取消
            </span>
        </template>
        </el-table-column>

    </el-table>
    <div style="margin: 10px 0">
        <el-pagination
        class="pagination"
        @size-change="SizeChange"
        @current-change="CurrentPageChange"
        :current-page="currentPage"
        :page-sizes="[5, 10, 15, 20]"
        :page-size="10"
        layout="total, sizes, prev, pager, next, jumper"
        :total="this.experData.length">
        </el-pagination>
    </div>
</div>
</template>

<script>

export default{
    name:"experiment",

    props:{
        dataList: Object,
        w_lock: Boolean,
    },

    data(){
        return{
            wlock:true,
            rowCache: {},
            totalPage: 1, // 统共页数，默认为1
            currentPage: 1, //当前页数 ，默认为1
            pageSize: 10, // 每页显示数量
            currentPageData: [], //当前页显示内容
            experData: []
        }
    },
    methods:{
        mytable(){
            return this.$setCss.tableHeadCell
        },
        mytableCell(){
            return this.$setCss.tableCell
        },

        //
        Select(value) {
            console.log(value)
        },
        SelectAll(value){
            console.log(value)
        },


        SetRow(row){
            row.cid = this.rowCache.cid
            row.cnum = this.rowCache.cnum
            row.id = this.rowCache.id
            row.overall = this.rowCache.overall
            row.p1 = this.rowCache.p1
            row.p2 = this.rowCache.p2
            row.p3 = this.rowCache.p3
            row.p4 = this.rowCache.p4
            row.p5 = this.rowCache.p5
            row.p6 = this.rowCache.p6
            row.p7 = this.rowCache.p7
            row.p8 = this.rowCache.p8
            row.r1 = this.rowCache.r1
            row.r2 = this.rowCache.r2
            row.r3 = this.rowCache.r3
            row.r4 = this.rowCache.r4
            row.r5 = this.rowCache.r5
            row.r6 = this.rowCache.r6
            row.r7 = this.rowCache.r7
            row.r8 = this.rowCache.r8
            row.regular = this.rowCache.regular
            row.sclass = this.rowCache.sclass
            row.selected = this.rowCache.selected
            row.sid = this.rowCache.sid
            row.sname = this.rowCache.sname
            row.sstate = this.rowCache.sstate
            row.stime = this.rowCache.stime
            row.written = this.rowCache.written
        },


        //增删改

        RowSave(row){
            this.wlock = true
            this.$request.post("/api_S/exper/update",row).then(res =>{
                if(res.code != '111'){
                    this.$message("保存成功")
                }
                else{
                    this.$message("Failed")
                }
            })
            row.selected = false
        },
        edit(row){
            this.rowCache = JSON.parse(JSON.stringify(row))
            if(!this.wlock){
                this.$message.warning("请先保存当前编辑项")
                return
            }
            row.selected = true
            this.wlock = false
        },
        cancel(row){
            var type = 1
            console.log(type)
            this.wlock = true
            if(this.rowCache != null){this.SetRow(row)}
            this.$emit("delEmptyRow",type)
        },
        RowDel(index,row){
            if(!this.wlock){
                this.$message.warning("请先保存当前编辑项")
                return
            }
            this.$request.post("/api_S/exper/delete",row).then(res =>{
                if(res.code != '111'){
                    this.$message("删除成功")
                    this.experData.splice(index,1)
                    this.load()
                }
                else{
                    this.$message("Failed")
                }
            })
        },

        //前端分页
        setCurrentPageData() {
            let begin = (this.currentPage - 1) * this.pageSize
            let end = this.currentPage * this.pageSize
            this.currentPageData = this.experData.slice(begin,end)
        },
        SizeChange(v){
            this.pageSize = v
            this.setCurrentPageData()
        },
        CurrentPageChange(v){
            this.currentPage = v
            this.setCurrentPageData()
        },

        //初始化
        load(){
            this.experData = this.dataList.ExperData
            // 计算一共有几页
            this.totalPage = Math.ceil(this.experData.length / this.pageSize)
            this.totalPage = this.totalPage == 0 ? 1 : this.totalPage
            this.setCurrentPageData()
        }

    },

    created(){
        this.load()
    },

    watch:{
        visible : function(newV,oldV){
            this.load()
        },
        dataList :function(){
            this.load()
        },
        w_lock : function(){
            this.wlock = this.w_lock
            this.CurrentPageChange(this.totalPage)
            this.rowCache = null
        }
    },


}
</script>

<style scoped>
.my_button{
    padding:2px;   
}
.my_button:hover{
    color:red;
}

</style>