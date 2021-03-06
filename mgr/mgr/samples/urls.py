# Copyright 2017 ZTE Corporation.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from django.conf.urls import url
from mgr.samples import views

urlpatterns = [
    url(r'^samples/$', views.SampleList.as_view()),
    url(r'^api/vnfmgr/v1/reloadstub/(?P<fileName>[0-9a-zA-Z\-\_\.]+)$', views.reloadstub, name='reloadstub'),
    url(r'^api/vnfmgr/v1/reg2msb/(?P<msName>[0-9a-zA-Z\-\_]+)$', views.reg2msb, name='reg2msb'),
    url(r'^(?P<uri>[0-9a-zA-Z\-\_/]+)$', views.stub, name='stub')
]
