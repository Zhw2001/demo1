<template>
  <div class="home-container">
    <div class="card">
      <div class="card-body">
        <semester-selector @semesterChange = "handleSemesterChange($event)" :semesterList = semesterList :semester = basicInfo.semester></semester-selector>
        <div class="mydoc">
          <p style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0;">
            <span
              style="font-family:'宋体'; font-weight:bold; letter-spacing:2pt;font-size:1vw;"
            >
              考试/考核内容合理性审核
            </span>
          </p>

          <div v-if="docVis === 0">
            <h1 class="myTitle">
              1.课程基本信息
            </h1>
            <table class="basicInfoTable">
              <tr>
                <td>
                  审核学期
                </td>

                <td>
                  {{ basicInfo.semester }}
                </td>
                <td>
                  审核时间
                </td>
                <td>
                  {{ basicInfo.audit_date }}
                </td>
              </tr>
              <tr>
                <td>
                  课程名称
                </td>
                <td>
                  {{ basicInfo.course_name }}
                </td>
                <td>
                  课程号
                </td>
                <td>
                  {{ basicInfo.course_number }}
                </td>
              </tr>
              <tr>
                <td>
                  班级
                </td>
                <td>
                  {{ basicInfo.classes }}
                </td>
                <td>
                  考试/考查
                </td>
                <td>
                  {{ basicInfo.exam_type }}
                </td>
              </tr>
            </table>

            <div><el-button type="text" @click="open(0)">编辑</el-button></div>
            <el-button style="margin-top:20px;" @click="nextDoc(1)" >下一步</el-button>
          </div>
          <div v-if="docVis === 1">
            <el-form>
              <el-form-item>
                <h1 class="myTitle">
                  2.考核内容
                </h1>
                <table class="CourseTargetTable">
                  <tr>
                    <th>
                      课程目标
                    </th>
                    <td v-for="(item, i) in cTargetForm.ctargets" :key="i">
                      课程目标{{ i + 1 }}：{{ item.value }}
                    </td>
                  </tr>
                </table>

                <div>
                  <el-button type="text" @click="open(1)">编辑</el-button>
                </div>
              </el-form-item>
            </el-form>
            <el-button style="margin-top:20px;" @click="nextDoc(0)" >上一步</el-button>
            <el-button style="margin-top:20px;" @click="nextDoc(2)" >下一步</el-button>
          </div>
          <div v-if="docVis === 2">
            <p class="mySecondTitle">
              2.1考核比例
            </p>
            <table class="ExamRatioTable">
              <template v-for="(mod, i) in modForm.mods">
                <tr :key="i + 'NAME'">
                  <th rowspan="2">
                    {{ mod.name }}
                  </th>
                  <td>
                    考核方式
                  </td>
                  <td
                    v-for="(partName, p_index) in mod.partNames"
                    :key="mod.name + 'NAME' + p_index"
                  >
                    {{ partName }}
                  </td>
                  <td
                    v-for="(item, block_index) in mod.emptyBlocks"
                    :key="i + block_index + 'NAME'"
                  ></td>
                  <td>
                    小计
                  </td>
                </tr>
                <tr :key="i + 'RATIO'">
                  <td>
                    所占比例
                  </td>
                  <td
                    v-for="(partRatio, r_index) in mod.partRatios"
                    :key="mod.name + 'RATIO' + r_index"
                  >
                    {{ partRatio }}
                  </td>
                  <td
                    v-for="(item, block_index) in mod.emptyBlocks"
                    :key="i + block_index + 'RATIO'"
                  ></td>
                  <td>{{ mod.total }}%</td>
                </tr>
              </template>
              <tr>
                <td>合计</td>
                <td></td>
                <td
                  v-for="(item, block_index) in emptyBlocks"
                  :key="block_index"
                ></td>
                <td>{{ total }}%</td>
              </tr>
            </table>

            <div><el-button type="text" @click="open(2)">编辑</el-button></div>
            <p class="mySecondTitle">2.2内容分布</p>
            <table class="ContentTable">
              <tr>
                <th>
                  课程目标
                </th>
                <th>
                  支撑毕业要求
                </th>
                <th>
                  考核方式
                </th>
                <th>
                  考试题目
                </th>
                <th>
                  成绩比例
                </th>
              </tr>
              <tr v-for="(ctarget, index) in cTargetForm.ctargets" :key="index">
                <td>课程目标 {{ index + 1 }}</td>
                <td>支撑毕业要求 {{ ctarget.support_graduation_require }}</td>
                <td>
                  <span v-for="part in ctarget.parts" :key="part + 'e_part'">
                    {{ part }}
                  </span>
                </td>
                <td>
                  <span v-for="item in ctarget.content" :key="item + 'e_item'">
                    {{ item }}
                  </span>
                </td>
                <td>
                  {{ ctarget.total }}
                </td>
              </tr>

              <tr>
                <td colspan="2">
                  合计
                </td>
                <td></td>
                <td></td>
                <td>{{ ctotal }}%</td>
              </tr>
            </table>

            <div><el-button type="text" @click="open(3)">编辑</el-button></div>
            <el-button style="margin-top:20px;" @click="nextDoc(1)" >上一步</el-button>
            <el-button @click="nextDoc(3)">下一步</el-button>
          </div>
          <div v-if="docVis === 3">
            <h1 class="myTitle">3.评分标准</h1>
            <table class="CTargetContextTable">
              <tr>
                <th rowspan="2">
                  课程目标
                </th>
                <th colspan="5">
                  评分标准
                </th>
              </tr>
              <tr>
                <td>
                  优秀
                </td>
                <td>
                  良好
                </td>
                <td>
                  中等
                </td>
                <td>
                  及格
                </td>
                <td>
                  不及格
                </td>
              </tr>

              <tr v-for="(ctarget, i) in cTargetForm.ctargets" :key="i">
                <td>目标{{ i + 1 }}</td>
                <td v-for="(standard, j) in ctarget.standards" :key="j">
                  <span>{{ standard }}</span>
                </td>
              </tr>
            </table>
            <el-button style="margin-top:20px;" @click="nextDoc(2)" >上一步</el-button>
            <el-button style="margin-top:20px;" @click="nextDoc(4)" >下一步</el-button>
          </div>
          <div v-if="docVis === 4">
            <h1 class="myTitle">4.命题规范</h1>
            <table class="QStandardTable">
              <tr v-for="(item, index) in question_standard" :key="index">
                <td>
                  <p>
                    <span>
                      {{ item }}
                    </span>
                  </p>
                </td>
                <td>
                  <p>
                    <span>
                      <input
                        :id="index"
                        name="checkbox"
                        type="checkbox"
                        @click="setSpecify"
                        checked="true"
                      />
                    </span>
                  </p>
                </td>
              </tr>
              <tr>
                <td>
                  <p>
                    <span>
                      期望通过考核的学生比例
                    </span>
                  </p>
                </td>
                <td>
                  <p>
                    <span>
                      <input style="text-align:center;" v-model="passRatio" />%
                    </span>
                  </p>
                </td>
              </tr>
            </table>

            <table style="margin-top:10px;" class="FinalTable">
              <tr>
                <th>
                  <p>
                    <span>
                      命题教师:
                    </span>
                  </p>
                </th>
                <td>
                  <p>
                    <input style="text-align:center;" v-model="basicInfo.set_paper_person"/>
                  </p>
                </td>
                <th>
                  <p>
                    <span>
                      审核人:
                    </span>
                  </p>
                </th>
                <td>
                  <p>
                    <span>
                      <input style="text-align:center;" v-model="basicInfo.audit_person"/>
                    </span>
                  </p>
                </td>
                <th>
                  <p>
                    <span>
                      日期:
                    </span>
                  </p>
                </th>
                <td>
                  <p>
                    <span>
                      <input style="text-align:center;" v-model="basicInfo.audit_date"/>
                    </span>
                  </p>
                </td>
              </tr>
            </table>

            <div style="margin-top:20px;">
              <el-button style="margin-top:20px;" @click="nextDoc(3)" >上一步</el-button>
              <el-button @click="sendDataBase()">发送DATABASE</el-button>
              <el-button @click="send()">发送</el-button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <el-dialog :showClose="false" :visible="dialogVis === 0" width="30%">
      <el-form
        :rules="basicInfoRules"
        label-position="left"
        label-width="100px"
        :model="basicInfo"
        ref="basicInfo"
      >
        <el-form-item label="审核学期" prop="semester">
          <el-input v-model="basicInfo.semester"></el-input>
        </el-form-item>
        <el-form-item label="审核时间" prop="audit_date">
          <el-input v-model="basicInfo.audit_date"></el-input>
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
        <el-button type="primary" @click="submitBasicFormConfirm('basicInfo')"
          >确定</el-button
        >
      </span>
    </el-dialog>

    <el-dialog :showClose="false" :visible="standardSetting === 1" width="50%">
      <el-form label-position="top" :model="standardForm" ref="standard">
        <label style="margin:10px 0px;"
          >课程目标{{ standardForm.ctarget_index + 1 }}</label
        >
        <el-form-item
          label="优秀"
          prop="S_Grade"
          :rules="{ required: true, message: '不能为空', trigger: 'blur' }"
        >
          <el-input type="textarea" autosize v-model="standardForm.S_Grade"></el-input>
        </el-form-item>
        <el-form-item
          label="良好"
          prop="A_Grade"
          :rules="{ required: true, message: '不能为空', trigger: 'blur' }"
        >
          <el-input type="textarea" autosize v-model="standardForm.A_Grade"></el-input>
        </el-form-item>
        <el-form-item
          label="中等"
          prop="B_Grade"
          :rules="{ required: true, message: '不能为空', trigger: 'blur' }"
        >
          <el-input type="textarea" autosize v-model="standardForm.B_Grade"></el-input>
        </el-form-item>
        <el-form-item
          label="及格"
          prop="C_Grade"
          :rules="{ required: true, message: '不能为空', trigger: 'blur' }"
        >
          <el-input type="textarea" autosize v-model="standardForm.C_Grade"></el-input>
        </el-form-item>
        <el-form-item
          label="不及格"
          prop="D_Grade"
          :rules="{ required: true, message: '不能为空', trigger: 'blur' }"
        >
          <el-input type="textarea" autosize v-model="standardForm.D_Grade"></el-input>
        </el-form-item>
        <el-form-item>
          <div style="display:flex;justify-content:flex-start;">
            <el-button type="primary" @click="submitStandard('standard')"
              >确定</el-button
            >
            <el-button @click="resetForm('standard')">重置</el-button>
          </div>
        </el-form-item>
      </el-form>
    </el-dialog>

    <el-dialog :showClose="false" :visible="dialogVis === 1" width="50%">
      <el-form label-position="left" :model="cTargetForm" ref="cTargetForm">
        <el-form-item>
          <el-button
            style="float:left;"
            @click="addCTarget()"
            size="mini"
            icon="el-icon-plus"
            circle
          ></el-button>
        </el-form-item>
        <el-form-item
          v-for="(ctarget, index) in cTargetForm.ctargets"
          :label="'目标' + (index + 1)"
          :key="index + 'value'"
          :prop="'ctargets.' + index + '.value'"
          :rules="{
            required: true,
            message: '不能为空',
            trigger: 'blur'
          }"
        >
          <div style="display:flex;flex-direction:row;flex-wrap: nowrap;">
            <el-input type="textarea" autosize style="flex:0 1 auto;" v-model="ctarget.value"></el-input>
            <div style="width:10px;flex:1 0 auto;"></div>
            <el-button
              style="flex:0 1 auto;"
              type="text"
              @click="openStandardSetting(index)"
              >设置评分标准</el-button
            >
            <el-button
              style="flex:0 1 auto;"
              type="text"
              @click="removeCtarget(ctarget)"
              >删除</el-button
            >
          </div>
        </el-form-item>
        <el-form-item
          v-for="(ctarget, index) in cTargetForm.ctargets"
          :label="'目标' + (index + 1) + '支撑毕业要求'"
          :key="index + 'sgr'"
          :prop="'ctargets.' + index + '.support_graduation_require'"
          :rules="{
            required: true,
            message: '不能为空',
            trigger: 'blur'
          }"
        >
          <el-input
            placeholder="1.1"
            style="width:50px;"
            v-model="ctarget.support_graduation_require"
          ></el-input>
        </el-form-item>

        <el-form-item>
          <div style="display:flex;justify-content:flex-start;">
            <el-button type="primary" @click="submitCFormConfirm('cTargetForm')"
              >确定</el-button
            >
            <el-button @click="resetForm('cTargetForm')">重置</el-button>
          </div>
        </el-form-item>
      </el-form>
    </el-dialog>

    <el-dialog :visible="dialogVis === 2" width="40%" :showClose="false">
      <template slot="title">
        <el-button
          icon="el-icon-back"
          size="mini"
          @click="Mback()"
          circle
        ></el-button>
      </template>
      <div
        style="display:flex;flex-direction:column;justify-content:space-between;"
      >
        <el-steps :active="step" finish-status="success" align-center>
          <el-step title="添加模块"></el-step>
          <el-step title="添加考核方式"></el-step>
          <el-step title="添加考试题目"></el-step>
          <el-step title="分配"></el-step>
        </el-steps>

        <template v-if="step === 0">
          <div style="margin:10px;">
            <el-button
              @click="addMod()"
              size="mini"
              icon="el-icon-plus"
              circle
            ></el-button>
          </div>
          <el-form label-position="left" :model="modForm" ref="modForm">
            <el-form-item
              label="模块名"
              v-for="(mod, index) in modForm.mods"
              :key="index"
              :prop="'mods.' + index + '.name'"
              :rules="modRules.name"
            >
              <div
                style="display:flex;flex-direction:row;flex-wrap: nowrap;justify-content:space-evenly;"
              >
                <el-input style="flex:0 1 auto;" v-model="mod.name"></el-input>
                <span style="width:10px;flex:1 0 auto;"></span>
                <el-button
                  style="flex:0 1 auto;"
                  type="text"
                  @click="removeMod(mod)"
                  >删除</el-button
                >
              </div>
            </el-form-item>
            <el-form-item>
              <el-button @click="resetMod()">重置</el-button>
            </el-form-item>
            <el-form-item>
              <div style="display:flex;justify-content:flex-end;">
                <el-button @click="Mnext('modForm')">NEXT</el-button>
              </div>
            </el-form-item>
          </el-form>
        </template>

        <template v-if="step === 1">
          <div style="margin:10px;">
            <el-button
              @click="addPart()"
              size="mini"
              icon="el-icon-plus"
              circle
            ></el-button>
          </div>
          <el-form label-position="left" :model="partForm" ref="partForm">
            <el-form-item
              label="名称"
              v-for="(part, index) in partForm.parts"
              :key="index"
              :prop="'parts.' + index + '.name'"
              :rules="partRules.name"
            >
              <div style="display:flex;flex-direction:row;flex-wrap: nowrap;">
                <el-input style="flex:0 2 auto;" v-model="part.name"></el-input>
                <span style="width:10px;flex:1 0 auto;"></span>
                <label
                  style="flex:1 0 auto;"
                  class="el-form-item__label"
                  slot="label"
                  >所占比例</label
                >
                <el-input
                  onkeyup="value=value.replace(/[^\d]/g,'')"
                  style="flex:0 2 auto;"
                  v-model="part.ratio"
                ></el-input>
                <span style="flex:1 0 auto;padding:0px 2px;">%</span>
                <span style="width:10px;flex:1 0 auto;"></span>
                <el-button
                  style="flex:0 0 auto;"
                  type="text"
                  @click="removePart(part)"
                  >删除</el-button
                >
              </div>
            </el-form-item>
            <el-form-item>
              <el-button @click="resetPart()">重置</el-button>
            </el-form-item>
            <el-form-item>
              <div style="display:flex;justify-content:flex-end;">
                <el-button @click="Mnext('partForm')">NEXT</el-button>
              </div>
            </el-form-item>
          </el-form>
        </template>

        <template v-if="step === 2">
          <div style="margin:10px;">
            <el-button
              @click="addItem()"
              size="mini"
              icon="el-icon-plus"
              circle
            ></el-button>
          </div>
          <el-form label-position="left" :model="itemForm" ref="itemForm">
            <el-form-item
              label="名称"
              v-for="(item, index) in itemForm.items"
              :key="index"
              :prop="'items.' + index + '.name'"
              :rules="itemRules.name"
            >
              <div style="display:flex;flex-direction:row;flex-wrap: nowrap;">
                <el-input style="flex:0 2 auto;" v-model="item.name"></el-input>
                <span style="width:10px;flex:1 0 auto;"></span>
                <label
                  style="flex:1 0 auto;"
                  class="el-form-item__label"
                  slot="label"
                  >分值:</label
                >
                <el-input
                  onkeyup="value=value.replace(/[^\d]/g,'')"
                  style="flex:0 2 auto;"
                  v-model="item.score"
                ></el-input>
                <span style="width:10px;flex:1 0 auto;"></span>
                <el-button
                  style="flex:0 0 auto;"
                  type="text"
                  @click="removeItem(item)"
                  >删除</el-button
                >
              </div>
            </el-form-item>
            <el-form-item>
              <el-button @click="resetItem()">重置</el-button>
            </el-form-item>
            <el-form-item>
              <div style="display:flex;justify-content:flex-end;">
                <el-button @click="Mnext('itemForm')">NEXT</el-button>
              </div>
            </el-form-item>
          </el-form>
        </template>

        <template v-if="step === 3">
          <div style="margin:10px;"></div>
          <el-form label-position="left" :model="modForm" ref="modForm">
            <el-tag
              size="small"
              style="margin:10px 0px 10px 0px;text-align:center;"
              type="info"
              >分配模块组成部分</el-tag
            >
            <el-form-item v-for="(mod, i) in modForm.mods" :key="i">
              <div
                style="display:flex;flex-direction:row;flex-wrap: nowrap;justify-content:space-evenly;"
              >
                <label
                  style="flex:1 1 auto;"
                  class="el-form-item__label"
                  slot="label"
                  >{{ mod.name }}组成部分:</label
                >
                <el-checkbox-group
                  style="flex:1 1 auto;"
                  v-model="mod.partNames"
                >
                  <el-checkbox
                    v-for="(part, index) in partForm.parts"
                    :key="part.name + i"
                    :label="part.name"
                    :disabled="!part.checklock"
                    @change="handlePartCheckChange(index)"
                  ></el-checkbox>
                </el-checkbox-group>
              </div>
            </el-form-item>
            <el-form-item>
              <div style="display:flex;justify-content:flex-end;">
                <el-button size="mini" type="text" @click="partReset()"
                  >重置</el-button
                >
              </div>
            </el-form-item>
            <el-tag
              size="small"
              style="margin:10px 0px 10px 0px;text-align:center;"
              type="info"
              >选择考试题目所属部分</el-tag
            >
            <el-form-item label="考试题目所属的部分是:">
              <el-select
                multiple
                clearable
                v-model="fatherOfItem"
                placeholder=""
              >
                <el-option
                  v-for="part in partForm.parts"
                  :key="part.name"
                  :label="part.name"
                  :value="part.name"
                >
                </el-option>
              </el-select>
            </el-form-item>
          </el-form>
          <div style="display:flex;justify-content:flex-end;">
            <el-button @click="ModFormConfirm()">确定</el-button>
          </div>
        </template>
      </div>
    </el-dialog>

    <el-dialog :showClose="false" :visible="dialogVis === 3" width="30%">
      <el-form label-position="left" :model="cTargetForm" ref="cTargetForm2">
        <el-form-item
          v-for="(ctarget, index) in cTargetForm.ctargets"
          :key="index + 'e_Type'"
        >
          <div
            style="display:flex;flex-direction:row;flex-wrap: nowrap;justify-content:space-evenly;"
          >
            <label
              style="flex:1 0 auto;"
              class="el-form-item__label"
              slot="label"
              >目标{{ index + 1 }}考核方式:</label
            >
            <el-checkbox-group style="flex:1 1 auto;" v-model="ctarget.parts">
              <el-checkbox
                v-for="(part, i) in partForm.parts"
                :key="index + i + 'TYPE'"
                :label="part.name"
              ></el-checkbox>
            </el-checkbox-group>
          </div>
        </el-form-item>
        <el-form-item>
          <div style="display:flex;justify-content:flex-end;">
            <el-button size="mini" type="text" @click="ctargetPartReset()"
              >重置</el-button
            >
          </div>
        </el-form-item>
        <el-form-item
          v-for="(ctarget, index) in cTargetForm.ctargets"
          :key="index + 'e_Q'"
        >
          <div
            style="display:flex;flex-direction:row;flex-wrap: nowrap;justify-content:space-evenly;"
          >
            <label
              style="flex:1 0 auto;"
              class="el-form-item__label"
              slot="label"
              >目标{{ index + 1 }}考试题目:</label
            >
            <el-checkbox-group style="flex:1 1 auto;" v-model="ctarget.content">
              <el-checkbox
                v-for="(item, i) in itemForm.items"
                :key="index + i + 'Q'"
                :label="item.name"
                :disabled="!item.checklock"
                @change="handleItemCheckChange(i)"
              ></el-checkbox>
            </el-checkbox-group>
          </div>
        </el-form-item>
        <el-form-item>
          <div style="display:flex;justify-content:flex-end;">
            <el-button size="mini" type="text" @click="itemReset()"
              >重置</el-button
            >
          </div>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="CFormFinalConfirm()"
            >确定</el-button
          >
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
import { Decimal } from 'decimal.js'
import SemesterSelector from "../component/SemesterSelector.vue"
export default {
  name: "examAudit",
    components: {
    'semester-selector': SemesterSelector,
  },
  data() {
    var validateSemester = (rule, value, callback) => {
      let patt = /[0-9]{4}-[0-9]{4}-[0-9]/;
      if (patt.test(value)) {
        callback();
      } else {
        callback(new Error("输入格式为2019-2020-1"));
      }
    };
    var validateModName = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入模块"));
      } else if (this.modNameValidate(value)) {
        callback(new Error("模块名不能相同!"));
      } else {
        callback();
      }
    };
    var validatePartName = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入名称"));
      } else if (this.partNameValidate(value)) {
        callback(new Error("名称不能相同!"));
      } else {
        callback();
      }
    };
    var validateItemName = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入"));
      } else if (this.itemNameValidate(value)) {
        callback(new Error("名称不能相同!"));
      } else {
        callback();
      }
    };
    return {
      edited: false,
      semesterList: [],
      standardSetting: 0,
      total: 0, //模块合计比例,calModTotal中计算
      ctotal: 0, //课程目标合计比例
      emptyBlocks: [],
      step: 0,
      fatherOfItem: [],
      docVis: 0,
      dialogVis: -1,
      standardForm: {
        ctarget_index: 0,
        S_Grade: "",
        A_Grade: "",
        B_Grade: "",
        C_Grade: "",
        D_Grade: ""
      },
      basicInfo: {},
      basicInfoRules: {
        semester: [{ validator: validateSemester, trigger: "change" }],
        audit_date: [{ required: true, message: "请输入日期", trigger: "blur" }],
        course_name: [
          { required: true, message: "请输入课程名", trigger: "blur" }
        ],
        course_number: [
          { required: true, message: "请输入课程号", trigger: "blur" }
        ],
        classes: [{ required: true, message: "请输入班级", trigger: "blur" }],
        exam_type: [
          { required: true, message: "请输入考试方式", trigger: "blur" }
        ]
      },
      cTargetForm: {
        ctargets: []
      },
      modForm: {
        mods: []
      },
      partForm: {
        parts: []
      },
      itemForm: {
        items: []
      },
      modRules: {
        name: [{ validator: validateModName, trigger: "change" }]
      },
      partRules: {
        name: [{ validator: validatePartName, trigger: "change" }]
      },
      itemRules: {
        name: [{ validator: validateItemName, trigger: "change" }]
      },
      question_standard: [],
      testSpecification: [],
      passRatio: 0
    };
  },
  methods: {
    handleSemesterChange(v) {
      if(!v){
        this.$message({
          type: "warning",
          message: "未选择学期"
        });
        return
      }
      this.basicInfo.semester = v
      this.load();
    },
    getSemester() {
      this.$request
        .get(
          "/api_S/exam_audit/semester_list?cid=" + this.basicInfo.course_number
        )
        .then(res => {
          this.semesterList = res.data;
        });
    },

    load() {
      this.$request
        .get(
          "/api_S/exam_audit/load_info?semester=" +
            this.basicInfo.semester +
            "&cid=" +
            this.basicInfo.course_number
        )
        .then(res => {
          let data = res.data;
          this.basicInfo = data.basicInfo;
          this.cTargetForm.ctargets =
            data.ctargets !== null ? data.ctargets : [];
          this.modForm.mods = data.mods !== null ? data.mods : [];
          this.partForm.parts = data.parts !== null ? data.parts : [];
          this.itemForm.items = data.items !== null ? data.items : [];
          this.fatherOfItem =
            data.fatherOfItem !== null ? data.fatherOfItem : [];
          this.question_standard = data.question_standard;
          for (let i of this.question_standard) {
            this.testSpecification.push(1);
          }
          this.setRatio();
          this.calModTotal();
          this.setCRatio();
          this.calCTargetTotal();
        });
    },

    sendDataBase() {
      if(this.edited === false){
        console.log("未曾修改")
        return
      }
      let data = {};
      data.ctargets = this.cTargetForm.ctargets;
      data.basicInfo = this.basicInfo;
      data.mods = this.modForm.mods;
      data.parts = this.partForm.parts;
      data.items = this.itemForm.items;
      data.fatherOfItem = this.fatherOfItem;
      this.$request.post("/api_S/exam_audit/update_audit", data).then(res => {
        console.log("11111111111", res);
      });
    },

    // 评分标准对话框提交
    submitStandard(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          let index = this.$refs[formName]._props.model.ctarget_index;
          if (this.cTargetForm.ctargets[index].standards) {
            this.cTargetForm.ctargets[index].standards = [];
          }
          this.cTargetForm.ctargets[index].standards.push(
            this.$refs[formName]._props.model.S_Grade
          );
          this.cTargetForm.ctargets[index].standards.push(
            this.$refs[formName]._props.model.A_Grade
          );
          this.cTargetForm.ctargets[index].standards.push(
            this.$refs[formName]._props.model.B_Grade
          );
          this.cTargetForm.ctargets[index].standards.push(
            this.$refs[formName]._props.model.C_Grade
          );
          this.cTargetForm.ctargets[index].standards.push(
            this.$refs[formName]._props.model.D_Grade
          );
          this.standardSetting = 0;
          this.resetForm(formName);
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    // 打开评分标准对话框
    openStandardSetting(i) {
      this.standardSetting = 1;
      this.standardForm.ctarget_index = i;
      this.standardForm.S_Grade = this.cTargetForm.ctargets[i].standards[0];
      this.standardForm.A_Grade = this.cTargetForm.ctargets[i].standards[1];
      this.standardForm.B_Grade = this.cTargetForm.ctargets[i].standards[2];
      this.standardForm.C_Grade = this.cTargetForm.ctargets[i].standards[3];
      this.standardForm.D_Grade = this.cTargetForm.ctargets[i].standards[4];
    },

    // 考核比例和内容分布
    CFormFinalConfirm() {
      //课程目标表最后一步，填写考核方式和考试题目
      this.setCRatio();
      this.calCTargetTotal();
      if(this.ctotal != 100){
        this.$message({
          type: "warning",
          message: "各课程目标所占比例之和应为100%"
        });
        return
      }
      this.close();
    },
    calCTargetTotal() {
      let temp = 0;
      for (let i of this.cTargetForm.ctargets) {
        let total = i.total == "" ? 0 : parseFloat(i.total);
        temp = new Decimal(temp).add(new Decimal(total)).toNumber().toFixed(2);
      }
      this.ctotal = temp;
    },
    setCRatio() {
      //计算每个课程目标所占的比例
      for (let i of this.cTargetForm.ctargets) {
        let temp_total = 0;
        let contentScore = 0;
        for (let j of i.content) {
          //计算课程目标考试题目的总分
          for (let k = 0; k < this.itemForm.items.length; k++) {
            if (this.itemForm.items[k].name == j) {
              let score =
                this.itemForm.items[k].score == ""
                  ? 0
                  : parseFloat(this.itemForm.items[k].score);
              contentScore = contentScore + score;
              break;
            }
          }
        }
        for (let x of i.parts) {
          for (let y = 0; y < this.partForm.parts.length; y++) {
            if (this.partForm.parts[y].name == x) {
              //根据名字找到part总表中的part对象
              if (this.fatherOfItem.indexOf(x) != -1) {
                //需要将课程目标所具有的考试题目与其对应部分的比例相乘，才是此课程目标真正的比例
                let part_ratio =  (this.partForm.parts[y].ratio == "" ? 0 : new Decimal( this.partForm.parts[y].ratio ).div(new Decimal( 100 ) ).toNumber());
                temp_total = new Decimal(temp_total).add(new Decimal(part_ratio).mul(new Decimal(contentScore))).toNumber();
              } else {
                let ratio =
                  this.partForm.parts[y].ratio == ""
                    ? 0
                    : parseFloat(this.partForm.parts[y].ratio);
                temp_total = new Decimal( temp_total ).add( new Decimal( ratio ) ).toNumber();
              }
              break;
            }
          }
        }
        i.total = temp_total;
      }
    },
    //模块填写最后一步确认
    ModFormConfirm() {
      this.setRatio()
      if(this.fatherOfItem.length < 1 ){
        this.$message({
          type: "warning",
          message: "请选择考试题目所属的部分"
        });
        return
      }
      if(this.calModTotal()){
        this.close()
        this.dialogVis = 3
        this.step = 0
      } else {
        this.$message({
          type: "warning",
          message: "各模块比例之和应为100%"
        });
      }
    },
    setRatio() {
      console.log("SET");
      let max = 0;
      for (let i of this.modForm.mods) {
        let temp_total = 0;
        if (i.partNames) {
          max = i.partNames.length > max ? i.partNames.length : max;
        }
        i.partRatios = []; //压入比例前先清空已有的
        for (let j of i.partNames) {
          for (let k = 0; k < this.partForm.parts.length; k++) {
            if (this.partForm.parts[k].name == j) {
              i.partRatios.push(this.partForm.parts[k].ratio);
              let total =
                this.partForm.parts[k].ratio == ""
                  ? 0
                  : parseFloat(this.partForm.parts[k].ratio);
              temp_total = temp_total + total;
            }
          }
        }
        i.total = temp_total;
      }
      for (let i of this.modForm.mods) {
        if (i.partNames) {
          i.emptyBlocks = new Array(max - i.partNames.length + 1)
            .join("0")
            .split("");
        }
      }
      let maxArry = [];
      for (let i = 0; i < max; i++) {
        maxArry.push(i);
      }
      this.emptyBlocks = maxArry;
    },
    calModTotal() {
      let temp = 0;
      for (let i of this.modForm.mods) {
        let total = i.total == "" ? 0 : parseInt(i.total);
        temp = temp + total;
      }
      this.total = temp;
      console.log(this.total)
      if(this.total !== 100){
        return false;
      }
      return true
    },

    // MOD,PART.ITEM表单验证
    itemNameValidate(name) {
      let count = 0;
      for (let i = 0; i < this.itemForm.items.length; i++) {
        if (this.itemForm.items[i].name === name) {
          count = count + 1;
          if (count > 1) return true;
        }
      }
      return false;
    },
    partNameValidate(name) {
      let count = 0;
      for (let i = 0; i < this.partForm.parts.length; i++) {
        if (this.partForm.parts[i].name === name) {
          count = count + 1;
          if (count > 1) return true;
        }
      }
      return false;
    },
    modNameValidate(name) {
      let count = 0;
      for (let i = 0; i < this.modForm.mods.length; i++) {
        if (this.modForm.mods[i].name === name) {
          count = count + 1;
          if (count > 1) return true;
        }
      }
      return false;
    },

    // 已选中的不能重复选
    handlePartCheckChange(p_index) {
      this.partForm.parts[p_index].checklock = !this.partForm.parts[p_index]
        .checklock;
    },
    handleItemCheckChange(i_index) {
      this.itemForm.items[i_index].checklock = !this.itemForm.items[i_index]
        .checklock;
    },

    //重置选择
    itemReset() {
      for (let i of this.itemForm.items) {
        i.checklock = true;
      }
      for (let j of this.cTargetForm.ctargets) {
        j.content = [];
      }
    },
    partReset() {
      for (let i of this.partForm.parts) {
        i.checklock = true;
      }
      for (let j of this.modForm.mods) {
        j.partNames = [];
        j.partRatios = [];
      }
    },
    ctargetPartReset() {
      for (let j of this.cTargetForm.ctargets) {
        j.parts = [];
      }
    },

    // MOD,PART,ITEM表单的下一步
    Mnext(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          if(this.step === 2){
            this.partReset()
          }
          this.step++
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    Mback() {
      if (this.step-- < 1) {
        this.step = 0;
      }
    },

    //ITEM,PART,MOD编辑
    addItem() {
      if (!this.itemForm.items) {
        this.itemForm.items = [];
      }
      this.itemForm.items.push({
        id: "",
        name: "",
        score: "",
        checklock: true
      });
    },
    removeItem(item) {
      var index = this.itemForm.items.indexOf(item);
      if (index !== -1) {
        this.itemForm.items.splice(index, 1);
      }
    },

    addPart() {
      if (!this.partForm.parts) {
        this.partForm.parts = [];
      }
      this.partForm.parts.push({
        id: "",
        name: "",
        ratio: "",
        checklock: true //true表示未占用
      });
    },
    removePart(item) {
      var index = this.partForm.parts.indexOf(item);
      if (index !== -1) {
        this.partForm.parts.splice(index, 1);
      }
    },

    addMod() {
      if (!this.modForm.mods) {
        this.modForm.mods = [];
      }
      this.modForm.mods.push({
        id: "",
        name: "",
        partNames: [],
        partRatios: [],
        emptyBlocks: [],
        total: 0
      });
    },
    removeMod(item) {
      var index = this.modForm.mods.indexOf(item);
      if (index !== -1) {
        this.modForm.mods.splice(index, 1);
      }
    },

    resetMod(){
      this.modForm.mods = []
    },
    resetPart(){
      this.partForm.parts = []
    },
    resetItem(){
      this.itemForm.items = []
    },

    //课程目标编辑
    removeCtarget(item) {
      var index = this.cTargetForm.ctargets.indexOf(item);
      if (index !== -1) {
        this.cTargetForm.ctargets.splice(index, 1);
      }
    },
    addCTarget() {
      if (!this.cTargetForm.ctargets) {
        this.cTargetForm.ctargets = [];
      }
      this.cTargetForm.ctargets.push({
        value: "", //input框输入
        content: [], //从checkbox中获取
        support_graduation_require: "", //手动输入
        parts: [], //从checkbox中获取
        total: 0, //最后计算，=parts中元素对应的比例之和
        standards: [] //评分标准
      });
    },
    submitCForm(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          let ctarget_length = 0;
          let A_LENGTH = 0;
          let B_LENGTH = 0;
          let C_LENGTH = 0;
          let D_LENGTH = 0;
          let E_LENGTH = 0;
          for (
            let i = 0;
            i < this.$refs[formName]._props.model.ctargets.length;
            i++
          ) {
            if (
              this.$refs[formName]._props.model.ctargets[i].standards.length === 0
            ) {
              this.$message({
                message: "请为课程目标" + (i + 1) + "设置评分标准",
                type: "warning"
              });
              return false;
            }
            for(let j = 0; j < this.$refs[formName]._props.model.ctargets[i].standards.length; j++){
              if(!this.$refs[formName]._props.model.ctargets[i].standards[j]){
                this.$message({
                  message: "请补全评分标准",
                  type: "warning"
                });
                return false;
              }
            }
            A_LENGTH =
              A_LENGTH +
              this.$refs[formName]._props.model.ctargets[i].standards[0].length;
            B_LENGTH =
              B_LENGTH +
              this.$refs[formName]._props.model.ctargets[i].standards[1].length;
            C_LENGTH =
              C_LENGTH +
              this.$refs[formName]._props.model.ctargets[i].standards[2].length;
            D_LENGTH =
              D_LENGTH +
              this.$refs[formName]._props.model.ctargets[i].standards[3].length;
            E_LENGTH =
              E_LENGTH +
              this.$refs[formName]._props.model.ctargets[i].standards[4].length;
            ctarget_length =
              ctarget_length +
              this.$refs[formName]._props.model.ctargets[i].value.length;
          }
          if (ctarget_length >= 1000) {
            this.$message({
              message: "课程目标描述不得大于1000字",
              type: "warning"
            });
            return false;
          }
          if (
            Math.max(A_LENGTH, B_LENGTH, C_LENGTH, D_LENGTH, E_LENGTH) >= 1000
          ) {
            this.$message({
              message: "评分标准过长",
              type: "warning"
            });
            return false;
          }
          this.close(); //校验通过，关闭对话框，否则不予关闭
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    submitCFormConfirm(v) {
      this.$confirm("确定修改该内容吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          this.submitCForm(v)
          this.edited = true
        })
        .catch(() => {
          this.resetForm(v)
          this.close()
          this.$message({
            type: "info",
            message: "已取消"
          });
        });
    },

    //基础信息编辑
    submitBasicForm(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          this.close();
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    submitBasicFormConfirm(v) {
      this.$confirm("确定修改该内容吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
      .then(() => {
        this.submitBasicForm(v)
        this.edited = true
      })
      .catch(() => {
        this.resetForm(v)
        this.close()
        this.$message({
          type: "info",
          message: "已取消"
        });
      });
    },
    //重置表单,可以复用
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },

    // 编辑MOD,PART,ITEM前的确认
    modRatioConfirm(i){
      this.$confirm("确定修改该内容吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
      .then(() => {
        this.edited = true
        this.fatherOfItem = []
        for(let t of this.modForm.mods){
          t.partNames = []
        }
        for(let r of this.cTargetForm.ctargets){
          r.content = []
          r.parts = []
        }
        this.dialogVis = i
      })
      .catch(() => {
        this.close()
        this.$message({
          type: "info",
          message: "已取消"
        });
      });
    },

    // 编辑内容分布前的确认
    ctargetRatioConfirm(i){
      this.$confirm("确定修改该内容吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
      .then(() => {
        this.edited = true
        for(let i of this.cTargetForm.ctargets){
          i.content = []
          i.parts = []
        }
        this.dialogVis = i
      })
      .catch(() => {
        this.close()
        this.$message({
          type: "info",
          message: "已取消"
        });
      });
    },
    
    //打开和关闭
    open(i) {
      if(i === 2 ){
        this.modRatioConfirm(i)
        return
      }
      if(i === 3 ){
        this.ctargetRatioConfirm(i)
        return
      }
      this.dialogVis = i;
    },
    close() {
      this.dialogVis = -1;
    },
    closeDoc() {
      this.docVis = -1;
    },
    openDoc(i) {
      this.docVis = i;
    },
    nextDoc(i) {
      this.closeDoc();
      this.openDoc(i);
    },

    //流程规范赋值
    setSpecify(event) {
      if (event.target.checked == true) {
        this.testSpecification[parseInt(event.target.id)] = 1;
      } else {
        this.testSpecification[parseInt(event.target.id)] = 0;
      }
    },
    findPart(name) {
      for (let i of this.partForm.parts) {
        if (i.name === name) {
          return i;
        }
      }
    },
    findItem(name) {
      for (let i of this.itemForm.items) {
        if (i.name === name) {
          return i;
        }
      }
    },
    //生成接口数据对象
    GenerateCTarget() {
      let data = {};
      data.semester = this.basicInfo.semester;
      data.date = this.basicInfo.audit_date;
      data.course_name = this.basicInfo.course_name;
      data.course_number = this.basicInfo.course_number;
      data.classes = this.basicInfo.classes;
      data.exam_type = this.basicInfo.exam_type;
      data.course_goals = [];
      for (let i of this.cTargetForm.ctargets) {
        let tmpObj = {};
        tmpObj["description"] = i.value;
        tmpObj["support_graduation_require"] =
          "支撑毕业要求" + i.support_graduation_require;
        let tempMod = {};
        for (let mod of this.modForm.mods) {
          let modName = mod.name;
          let tempPart = {};
          for (let partName of i.parts) {
            //遍历当前课程目标的part
            let tempItem = {};
            if (mod.partNames.indexOf(partName) != -1) {
              //当前课程目标的part属于这个模块则添加
              if (this.fatherOfItem.indexOf(partName) != -1) {
                //有考试题目项
                tempItem["proportion"] = this.findPart(partName).ratio;
                let content = {};
                for (let item of i.content) {
                  content[item] = this.findItem(item).score;
                }
                tempItem["content"] = content;
                tempPart[partName] = tempItem;
              } else {
                tempPart[partName] = this.findPart(partName).ratio;
              }
            }
          }
          tempMod[modName] = tempPart;
        }
        tmpObj["modules"] = tempMod;
        tmpObj["standard"] = i.standards;
        data.course_goals.push(tmpObj);
      }
      const tmpArray = JSON.parse(JSON.stringify(this.testSpecification));
      tmpArray.push(this.passRatio);
      data.question_specification = tmpArray;
      data.question_setter = this.basicInfo.set_paper_person;
      data.question_reviewer = this.basicInfo.audit_person;
      console.log(data);
      return data;
    },
    //发送数据
    send() {
      this.$request
        .post("/api_P/audit", this.GenerateCTarget(), { responseType: "blob" })
        .then(res => {
          console.log("11111111111", res);
          let blob = new Blob([res], { type: "application/msword" }); // 服务端返回的文件流excel文件
          let fileName = `审核表${new Date().getTime()}.doc`; // 保存的文件名
          this.downLoadFile(blob, fileName);
        });
    },
    //处理返回的二进制流
    downLoadFile(blob, fileName) {
      if (window.navigator.msSaveOrOpenBlob) {
        // IE10
        navigator.msSaveBlob(blob, fileName);
      } else {
        let link = document.createElement("a");
        link.style.display = "none";
        link.href = URL.createObjectURL(blob); //创建一个指向该参数对象的URL
        link.download = fileName;
        link.click(); // 触发下载
        URL.revokeObjectURL(link.href); // 释放通过 URL.createObjectURL() 创建的 URL
      }
    }
  },

  created() {
    if (!localStorage.getItem("selected_course")) {
      this.$message({
        type: "warning",
        message: "未选择课程"
      });
      this.$router.push("/");
    } else {
      this.basicInfo.course_number = JSON.parse(
        localStorage.getItem("selected_course")
      ).cid;
      this.getSemester();
    }
  },

  //实时计算相关属性并更新
  computed: {
    modRatioValidate: function() {
      // if( this.calPartsRatio(this.partForm.parts) != this.modForm.mods
      console.log("setR");
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
  font-size: 2vw;
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
  height: 4vw;
}

.basicInfoTable tr td {
  border-style: solid;
  border-width: 0.5pt;
  font-size: 1.2vw;
}

.CourseTargetTable {
  border-collapse: collapse;
  width: 80%;
}

.CourseTargetTable tr {
  min-height: 4vw;
}

.CourseTargetTable tr td {
  border-style: solid;
  border-width: 0.5pt;
  padding: 20px;
  font-size: 1vw;
  vertical-align: top;
}

.CourseTargetTable tr th {
  /*跨行表头*/
  border-style: solid;
  border-width: 0.5pt;
  font-size: 1.2vw;
  padding: 20px;
  font-weight: 500;
}

.ExamRatioTable {
  border-collapse: collapse;
  width: 80%;
}

.ExamRatioTable tr {
  min-height: 4vw;
}

.ExamRatioTable tr td {
  border-style: solid;
  border-width: 0.5pt;
  padding: 20px;
  font-size: 1vw;
}

.ExamRatioTable tr th {
  /*跨行表头*/
  border-style: solid;
  border-width: 0.5pt;
  font-size: 1.5vw;
  padding: 10px;
  font-weight: 500;
}

.ContentTable {
  border-collapse: collapse;
  width: 80%;
}

.ContentTable tr {
  min-height: 4vw;
}

.ContentTable tr td {
  border-style: solid;
  border-width: 0.5pt;
  padding: 20px;
  font-size: 1vw;
}

.ContentTable tr th {
  /*跨行表头*/
  border-style: solid;
  border-width: 0.5pt;
  font-size: 0.8vw;
  padding: 10px;
  font-weight: 600;
}

.CTargetContextTable {
  border-collapse: collapse;
  width: 80%;
}

.CTargetContextTable tr {
  min-height: 4vw;
}

.CTargetContextTable tr td {
  border-style: solid;
  border-width: 0.5pt;
  padding: 10px;
  font-size: 1vw;
}

.CTargetContextTable tr td span {
  font-size: 0.8vw;
  font-weight: 500;
}

.CTargetContextTable tr th {
  /*跨行表头*/
  border-style: solid;
  border-width: 0.5pt;
  font-size: 1.2vw;
  padding: 20px;
  font-weight: 500;
}

.QStandardTable {
  border-collapse: collapse;
  width: 80%;
}

.QStandardTable tr {
  height: 50px;
}

.QStandardTable tr td {
  border-style: solid;
  border-width: 0.5pt;
}

.QStandardTable tr td > p > span {
  /*普通格子*/
  width: 100%;
  font-size: 16px;
}

.FinalTable {
  border-collapse: collapse;
}

.FinalTable tr {
  height: 30px;
}

.FinalTable tr th > p {
  margin: 5px 5px 5px 20px;
}

.FinalTable tr th > p > span {
  width: 100%;
  font-size: 16px;
}

.FinalTable tr td > p > span {
  /*普通格子*/
  width: 100%;
  font-size: 16px;
}
</style>