defmodule K8s.Io.Api.Admission.V1beta1.AdmissionRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          uid: String.t(),
          kind: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.GroupVersionKind.t() | nil,
          resource: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.GroupVersionResource.t() | nil,
          subResource: String.t(),
          requestKind: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.GroupVersionKind.t() | nil,
          requestResource: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.GroupVersionResource.t() | nil,
          requestSubResource: String.t(),
          name: String.t(),
          namespace: String.t(),
          operation: String.t(),
          userInfo: K8s.Io.Api.Authentication.V1.UserInfo.t() | nil,
          object: K8s.Io.Apimachinery.Pkg.Runtime.RawExtension.t() | nil,
          oldObject: K8s.Io.Apimachinery.Pkg.Runtime.RawExtension.t() | nil,
          dryRun: boolean,
          options: K8s.Io.Apimachinery.Pkg.Runtime.RawExtension.t() | nil
        }
  defstruct [
    :uid,
    :kind,
    :resource,
    :subResource,
    :requestKind,
    :requestResource,
    :requestSubResource,
    :name,
    :namespace,
    :operation,
    :userInfo,
    :object,
    :oldObject,
    :dryRun,
    :options
  ]

  field :uid, 1, optional: true, type: :string
  field :kind, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.GroupVersionKind

  field :resource, 3,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.GroupVersionResource

  field :subResource, 4, optional: true, type: :string

  field :requestKind, 13,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.GroupVersionKind

  field :requestResource, 14,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.GroupVersionResource

  field :requestSubResource, 15, optional: true, type: :string
  field :name, 5, optional: true, type: :string
  field :namespace, 6, optional: true, type: :string
  field :operation, 7, optional: true, type: :string
  field :userInfo, 8, optional: true, type: K8s.Io.Api.Authentication.V1.UserInfo
  field :object, 9, optional: true, type: K8s.Io.Apimachinery.Pkg.Runtime.RawExtension
  field :oldObject, 10, optional: true, type: K8s.Io.Apimachinery.Pkg.Runtime.RawExtension
  field :dryRun, 11, optional: true, type: :bool
  field :options, 12, optional: true, type: K8s.Io.Apimachinery.Pkg.Runtime.RawExtension
end

defmodule K8s.Io.Api.Admission.V1beta1.AdmissionResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          uid: String.t(),
          allowed: boolean,
          status: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Status.t() | nil,
          patch: binary,
          patchType: String.t(),
          auditAnnotations: %{String.t() => String.t()}
        }
  defstruct [:uid, :allowed, :status, :patch, :patchType, :auditAnnotations]

  field :uid, 1, optional: true, type: :string
  field :allowed, 2, optional: true, type: :bool
  field :status, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Status
  field :patch, 4, optional: true, type: :bytes
  field :patchType, 5, optional: true, type: :string

  field :auditAnnotations, 6,
    repeated: true,
    type: K8s.Io.Api.Admission.V1beta1.AdmissionResponse.AuditAnnotationsEntry,
    map: true
end

defmodule K8s.Io.Api.Admission.V1beta1.AdmissionResponse.AuditAnnotationsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Admission.V1beta1.AdmissionReview do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          request: K8s.Io.Api.Admission.V1beta1.AdmissionRequest.t() | nil,
          response: K8s.Io.Api.Admission.V1beta1.AdmissionResponse.t() | nil
        }
  defstruct [:request, :response]

  field :request, 1, optional: true, type: K8s.Io.Api.Admission.V1beta1.AdmissionRequest
  field :response, 2, optional: true, type: K8s.Io.Api.Admission.V1beta1.AdmissionResponse
end
