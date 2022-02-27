<template>
<div>
    <el-table       
    :fit = "true"
    stripe
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
        label="选题">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.select" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.select}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="平时">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.begin" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.begin}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="中期检查">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.medium" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.medium}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="程序检查">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.program" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.program}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="答辩情况">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.answer" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.answer}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="设计报告">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.report" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.report}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="总分">
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
        :total="this.cdesignData.length">
        </el-pagination>
    </div>
</div>
</template>

<script>

export default{
    name:"course",

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
            cdesignData: []
        }
    },
    methods:{
        mytable(){
            return this.$setCss.tableHeadCell
        },
        mytableCell(){
            return this.$setCss.tableCell
        },
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
            row.regular = this.rowCache.regular
            row.sclass = this.rowCache.sclass
            row.selected = this.rowCache.selected
            row.sid = this.rowCache.sid
            row.sname = this.rowCache.sname
            row.sstate = this.rowCache.sstate
            row.stime = this.rowCache.stime
            row.written = this.rowCache.written
        },


        RowSave(row){
            this.wlock = true
            this.$request.post("/api_S/cdesign/update",row).then(res =>{
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
            var type = 2
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
            this.$request.post("/api_S/cdesign/delete",row).then(res =>{
                if(res.code != '111'){
                    this.$message("删除成功")
                    this.cdesignData.splice(index,1)
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
            this.currentPageData = this.cdesignData.slice(begin,end)
        },
        SizeChange(v){
            this.pageSize = v
            this.setCurrentPageData()
        },
        CurrentPageChange(v){
            this.currentPage = v
            this.setCurrentPageData()
        },

        
        load(){
            this.cdesignData = this.dataList.CdesignData
            // 计算一共有几页
            this.totalPage = Math.ceil(this.cdesignData.length / this.pageSize)
            this.totalPage = this.totalPage == 0 ? 1 : this.totalPage
            this.setCurrentPageData()
        }

        
    },

    created(){
        this.load()
    },

    watch:{
        'dataList.CdesignData' :function(){
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